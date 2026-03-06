#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCENARIOS_FILE="${ROOT_DIR}/scripts/fixtures/ci_trigger_scenarios.tsv"

if [[ ! -f "${SCENARIOS_FILE}" ]]; then
  echo "missing scenario fixture file: ${SCENARIOS_FILE}" >&2
  exit 1
fi

mutate_first=false
if [[ "${1:-}" == "--mutate-first" ]]; then
  mutate_first=true
fi

workflow_file_for() {
  local workflow_key="$1"
  case "${workflow_key}" in
    qa-gates) echo "${ROOT_DIR}/.github/workflows/qa-gates.yml" ;;
    release-policy) echo "${ROOT_DIR}/.github/workflows/release-policy.yml" ;;
    *) return 1 ;;
  esac
}

extract_paths() {
  local workflow_file="$1"
  local event_name="$2"
  awk -v event="${event_name}" '
    $0 ~ "^  " event ":" { in_event = 1; in_paths = 0; next }
    in_event && $0 ~ "^    paths:" { in_paths = 1; next }
    in_event && in_paths && $0 ~ "^      - " {
      line = $0
      sub(/^      - /, "", line)
      gsub(/"/, "", line)
      print line
      next
    }
    in_event && in_paths && $0 !~ "^      - " { exit }
    in_event && !in_paths && $0 ~ "^  [a-zA-Z_]+:" && $0 !~ "^  " event ":" { in_event = 0 }
  ' "${workflow_file}"
}

matches_any_pattern() {
  local changed_path="$1"
  shift
  for pattern in "$@"; do
    if [[ "${changed_path}" == ${pattern} ]]; then
      return 0
    fi
  done
  return 1
}

total=0
failed=0
mutated=false

printf '%-15s | %-12s | %-44s | %-11s | %-11s\n' "workflow" "event" "path" "expected" "actual"
printf '%s\n' "-----------------------------------------------------------------------------------------------"

while IFS='|' read -r workflow_key event_name changed_path expected; do
  [[ -z "${workflow_key}" ]] && continue
  [[ "${workflow_key}" =~ ^# ]] && continue

  workflow_file="$(workflow_file_for "${workflow_key}")" || {
    echo "unknown workflow key in fixture: ${workflow_key}" >&2
    exit 1
  }

  mapfile -t paths < <(extract_paths "${workflow_file}" "${event_name}")
  if [[ "${#paths[@]}" -eq 0 ]]; then
    echo "no paths extracted for ${workflow_key}:${event_name}" >&2
    exit 1
  fi

  effective_expected="${expected}"
  if [[ "${mutate_first}" == "true" && "${mutated}" == "false" ]]; then
    if [[ "${expected}" == "trigger" ]]; then
      effective_expected="no-trigger"
    else
      effective_expected="trigger"
    fi
    mutated=true
  fi

  actual="no-trigger"
  if matches_any_pattern "${changed_path}" "${paths[@]}"; then
    actual="trigger"
  fi

  printf '%-15s | %-12s | %-44s | %-11s | %-11s\n' "${workflow_key}" "${event_name}" "${changed_path}" "${effective_expected}" "${actual}"
  total=$((total + 1))
  if [[ "${effective_expected}" != "${actual}" ]]; then
    failed=$((failed + 1))
  fi
done < "${SCENARIOS_FILE}"

printf '\nChecked scenarios: %d\n' "${total}"
if [[ "${failed}" -ne 0 ]]; then
  printf 'Result: FAIL (%d mismatches)\n' "${failed}" >&2
  exit 1
fi

echo "Result: PASS"

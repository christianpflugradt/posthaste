#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FIXTURES_DIR="${ROOT_DIR}/eval/fixtures/pb-0001"
BASELINES_DIR="${ROOT_DIR}/eval/baselines/pb-0001"
THRESHOLDS_FILE="${ROOT_DIR}/eval/baselines/pb-0001-thresholds.env"
RESULTS_DIR="${ROOT_DIR}/eval/results"
RESULTS_FILE="${RESULTS_DIR}/PB-0001-eval-latest.md"

if [[ ! -f "${THRESHOLDS_FILE}" ]]; then
  echo "missing thresholds file: ${THRESHOLDS_FILE}" >&2
  exit 1
fi

source "${THRESHOLDS_FILE}"
mkdir -p "${RESULTS_DIR}"

broad_tags=("ai" "technology" "innovation" "leadership")
specific_tags=("productmanagement" "softwareengineering" "devops" "datascience" "cybersecurity" "startups" "remotework" "careerdevelopment")

is_in_list() {
  local needle="$1"
  shift
  for item in "$@"; do
    if [[ "${item}" == "${needle}" ]]; then
      return 0
    fi
  done
  return 1
}

sum_relevance=0
sum_specificity=0
sum_diversity=0
sum_format=0
case_count=0

{
  echo "# PB-0001 Evaluation Results"
  echo
  echo "| Fixture | Relevance | Specificity | Diversity | Format Validity |"
  echo "| --- | ---: | ---: | ---: | ---: |"
} > "${RESULTS_FILE}"

for fixture in "${FIXTURES_DIR}"/*.txt; do
  name="$(basename "${fixture}" .txt)"
  baseline="${BASELINES_DIR}/${name}.expected"
  if [[ ! -f "${baseline}" ]]; then
    echo "missing baseline file: ${baseline}" >&2
    exit 1
  fi

  actual_raw="$(cargo run --quiet -- "${fixture}")"
  expected_raw="$(cat "${baseline}")"

  mapfile -t actual_lines < <(printf '%s\n' "${actual_raw}" | sed '/^$/d')
  mapfile -t expected_lines < <(printf '%s\n' "${expected_raw}" | sed '/^$/d')

  if [[ "${#actual_lines[@]}" -eq 0 || "${#expected_lines[@]}" -eq 0 ]]; then
    echo "fixture ${name} produced empty evaluation vectors" >&2
    exit 1
  fi

  expected_set="$(printf '%s\n' "${expected_lines[@]}" | sort -u)"
  actual_set="$(printf '%s\n' "${actual_lines[@]}" | sort -u)"
  overlap_count="$(comm -12 <(printf '%s\n' "${expected_set}") <(printf '%s\n' "${actual_set}") | sed '/^$/d' | wc -l | tr -d ' ')"
  expected_count="${#expected_lines[@]}"
  relevance="$(awk -v a="${overlap_count}" -v b="${expected_count}" 'BEGIN { printf "%.4f", a / b }')"

  specific_count=0
  broad_count=0
  format_count=0
  for line in "${actual_lines[@]}"; do
    clean="${line#\#}"
    if [[ "${line}" =~ ^#[a-z0-9]+$ ]]; then
      format_count=$((format_count + 1))
    fi
    if is_in_list "${clean}" "${specific_tags[@]}"; then
      specific_count=$((specific_count + 1))
    fi
    if is_in_list "${clean}" "${broad_tags[@]}"; then
      broad_count=$((broad_count + 1))
    fi
  done

  actual_count="${#actual_lines[@]}"
  specificity="$(awk -v a="${specific_count}" -v b="${actual_count}" 'BEGIN { printf "%.4f", a / b }')"
  format_validity="$(awk -v a="${format_count}" -v b="${actual_count}" 'BEGIN { printf "%.4f", a / b }')"
  if (( broad_count > 0 && specific_count > 0 )); then
    diversity="1.0000"
  else
    diversity="0.0000"
  fi

  echo "| ${name} | ${relevance} | ${specificity} | ${diversity} | ${format_validity} |" >> "${RESULTS_FILE}"

  sum_relevance="$(awk -v x="${sum_relevance}" -v y="${relevance}" 'BEGIN { printf "%.6f", x + y }')"
  sum_specificity="$(awk -v x="${sum_specificity}" -v y="${specificity}" 'BEGIN { printf "%.6f", x + y }')"
  sum_diversity="$(awk -v x="${sum_diversity}" -v y="${diversity}" 'BEGIN { printf "%.6f", x + y }')"
  sum_format="$(awk -v x="${sum_format}" -v y="${format_validity}" 'BEGIN { printf "%.6f", x + y }')"
  case_count=$((case_count + 1))
done

avg_relevance="$(awk -v x="${sum_relevance}" -v n="${case_count}" 'BEGIN { printf "%.4f", x / n }')"
avg_specificity="$(awk -v x="${sum_specificity}" -v n="${case_count}" 'BEGIN { printf "%.4f", x / n }')"
avg_diversity="$(awk -v x="${sum_diversity}" -v n="${case_count}" 'BEGIN { printf "%.4f", x / n }')"
avg_format="$(awk -v x="${sum_format}" -v n="${case_count}" 'BEGIN { printf "%.4f", x / n }')"

{
  echo
  echo "## Aggregates"
  echo
  echo "- Relevance: ${avg_relevance}"
  echo "- Specificity: ${avg_specificity}"
  echo "- Diversity: ${avg_diversity}"
  echo "- Format validity: ${avg_format}"
  echo
  echo "## Thresholds"
  echo
  echo "- Relevance >= ${MIN_RELEVANCE}"
  echo "- Specificity >= ${MIN_SPECIFICITY}"
  echo "- Diversity >= ${MIN_DIVERSITY}"
  echo "- Format validity >= ${MIN_FORMAT_VALIDITY}"
} >> "${RESULTS_FILE}"

pass=true

if ! awk -v a="${avg_relevance}" -v b="${MIN_RELEVANCE}" 'BEGIN { exit !(a >= b) }'; then
  pass=false
fi
if ! awk -v a="${avg_specificity}" -v b="${MIN_SPECIFICITY}" 'BEGIN { exit !(a >= b) }'; then
  pass=false
fi
if ! awk -v a="${avg_diversity}" -v b="${MIN_DIVERSITY}" 'BEGIN { exit !(a >= b) }'; then
  pass=false
fi
if ! awk -v a="${avg_format}" -v b="${MIN_FORMAT_VALIDITY}" 'BEGIN { exit !(a >= b) }'; then
  pass=false
fi

if [[ "${pass}" == "true" ]]; then
  echo >> "${RESULTS_FILE}"
  echo "## Decision" >> "${RESULTS_FILE}"
  echo >> "${RESULTS_FILE}"
  echo "PASS" >> "${RESULTS_FILE}"
  cat "${RESULTS_FILE}"
  exit 0
fi

echo >> "${RESULTS_FILE}"
echo "## Decision" >> "${RESULTS_FILE}"
echo >> "${RESULTS_FILE}"
echo "FAIL" >> "${RESULTS_FILE}"
cat "${RESULTS_FILE}"
exit 1

use std::collections::HashSet;

#[derive(Clone, Copy, PartialEq, Eq)]
enum Specificity {
    Broad,
    Specific,
}

#[derive(Clone, Copy)]
struct Hashtag {
    tag: &'static str,
    popularity: u16,
    specificity: Specificity,
    keywords: &'static [&'static str],
}

#[derive(Clone, Copy)]
struct ScoredHashtag {
    hashtag: Hashtag,
    relevance: usize,
    score: usize,
}

const DEFAULT_COUNT: usize = 8;
const MIN_COUNT: usize = 5;
const MAX_COUNT: usize = 10;

const HASHTAGS: &[Hashtag] = &[
    Hashtag {
        tag: "ai",
        popularity: 95,
        specificity: Specificity::Broad,
        keywords: &["ai", "artificial", "machine", "ml"],
    },
    Hashtag {
        tag: "technology",
        popularity: 90,
        specificity: Specificity::Broad,
        keywords: &["technology", "tech", "software"],
    },
    Hashtag {
        tag: "innovation",
        popularity: 82,
        specificity: Specificity::Broad,
        keywords: &["innovation", "innovative", "breakthrough"],
    },
    Hashtag {
        tag: "leadership",
        popularity: 80,
        specificity: Specificity::Broad,
        keywords: &["leadership", "leader", "management", "manager"],
    },
    Hashtag {
        tag: "productmanagement",
        popularity: 73,
        specificity: Specificity::Specific,
        keywords: &["product", "roadmap", "backlog", "pm"],
    },
    Hashtag {
        tag: "softwareengineering",
        popularity: 72,
        specificity: Specificity::Specific,
        keywords: &["engineering", "developer", "coding", "code"],
    },
    Hashtag {
        tag: "devops",
        popularity: 68,
        specificity: Specificity::Specific,
        keywords: &["devops", "ci", "cd", "pipeline", "deployment"],
    },
    Hashtag {
        tag: "datascience",
        popularity: 70,
        specificity: Specificity::Specific,
        keywords: &["data", "dataset", "analytics", "model"],
    },
    Hashtag {
        tag: "cybersecurity",
        popularity: 67,
        specificity: Specificity::Specific,
        keywords: &["security", "vulnerability", "threat", "privacy"],
    },
    Hashtag {
        tag: "startups",
        popularity: 66,
        specificity: Specificity::Specific,
        keywords: &["startup", "founder", "funding", "venture"],
    },
    Hashtag {
        tag: "remotework",
        popularity: 62,
        specificity: Specificity::Specific,
        keywords: &["remote", "distributed", "hybrid", "async"],
    },
    Hashtag {
        tag: "careerdevelopment",
        popularity: 64,
        specificity: Specificity::Specific,
        keywords: &["career", "mentorship", "hiring", "interview"],
    },
];

pub fn default_count() -> usize {
    DEFAULT_COUNT
}

pub fn count_bounds() -> (usize, usize) {
    (MIN_COUNT, MAX_COUNT)
}

pub fn generate_hashtags(input: &str, count: usize) -> Vec<String> {
    let bounded_count = count.clamp(MIN_COUNT, MAX_COUNT);
    let tokens = tokenize(input);
    let mut scored = score_hashtags(&tokens);
    scored.sort_by(|a, b| {
        b.score
            .cmp(&a.score)
            .then(b.relevance.cmp(&a.relevance))
            .then(a.hashtag.tag.cmp(b.hashtag.tag))
    });
    select_balanced(scored, bounded_count)
}

fn tokenize(input: &str) -> HashSet<String> {
    input
        .split(|ch: char| !ch.is_alphanumeric())
        .filter(|token| !token.is_empty())
        .map(|token| token.to_ascii_lowercase())
        .collect()
}

fn score_hashtags(tokens: &HashSet<String>) -> Vec<ScoredHashtag> {
    HASHTAGS
        .iter()
        .map(|hashtag| {
            let relevance = hashtag
                .keywords
                .iter()
                .filter(|keyword| tokens.contains(**keyword))
                .count();
            let score = relevance * 100 + usize::from(hashtag.popularity);
            ScoredHashtag {
                hashtag: *hashtag,
                relevance,
                score,
            }
        })
        .collect()
}

fn select_balanced(scored: Vec<ScoredHashtag>, count: usize) -> Vec<String> {
    let mut broad = Vec::new();
    let mut specific = Vec::new();
    for item in scored {
        match item.hashtag.specificity {
            Specificity::Broad => broad.push(item),
            Specificity::Specific => specific.push(item),
        }
    }

    let broad_cap = (count / 3).max(1);
    let mut selected: Vec<&'static str> = Vec::new();

    if let Some(item) = broad.iter().find(|item| item.relevance > 0) {
        selected.push(item.hashtag.tag);
    }

    for item in specific.iter().take(count) {
        if !selected.contains(&item.hashtag.tag) {
            selected.push(item.hashtag.tag);
        }
        if selected.len() == count {
            break;
        }
    }

    if selected.len() < count {
        for item in broad.iter().take(broad_cap) {
            if !selected.contains(&item.hashtag.tag) {
                selected.push(item.hashtag.tag);
            }
            if selected.len() == count {
                break;
            }
        }
    }

    if selected.len() < count {
        for item in broad.iter().skip(broad_cap) {
            if !selected.contains(&item.hashtag.tag) {
                selected.push(item.hashtag.tag);
            }
            if selected.len() == count {
                break;
            }
        }
    }

    selected.into_iter().map(|tag| format!("#{tag}")).collect()
}

#[cfg(test)]
mod tests {
    use super::{count_bounds, default_count, generate_hashtags};

    #[test]
    fn returns_deterministic_output_for_same_input() {
        let input = "AI and data analytics for product roadmap and engineering leadership";
        let first = generate_hashtags(input, default_count());
        let second = generate_hashtags(input, default_count());
        assert_eq!(first, second);
    }

    #[test]
    fn keeps_output_within_required_bounds() {
        let input = "Product roadmap engineering developer leadership ai data";
        let (min_count, max_count) = count_bounds();
        let result = generate_hashtags(input, default_count());
        assert!(result.len() >= min_count);
        assert!(result.len() <= max_count);
    }

    #[test]
    fn enforces_minimum_count_for_sparse_input() {
        let input = "privacy";
        let (min_count, max_count) = count_bounds();
        let result = generate_hashtags(input, default_count());
        assert!(result.len() >= min_count);
        assert!(result.len() <= max_count);
    }

    #[test]
    fn keeps_generic_tags_from_dominating_when_specifics_exist() {
        let input =
            "software engineering devops deployment ci cd product roadmap data model ai technology";
        let result = generate_hashtags(input, default_count());
        let broad_count = result
            .iter()
            .filter(|tag| *tag == "#ai" || *tag == "#technology" || *tag == "#innovation")
            .count();
        assert!(broad_count <= result.len() / 2);
    }

    #[test]
    fn returns_prefixed_plain_tags() {
        let input = "security privacy vulnerabilities threat model";
        let result = generate_hashtags(input, default_count());
        assert!(!result.is_empty());
        assert!(result.iter().all(|tag| tag.starts_with('#')));
    }
}

use std::env;
use std::fs;
use std::process;

#[derive(Debug)]
enum Command {
    Hello,
    FilePath(String),
}

fn fail(message: &str) -> ! {
    eprintln!("err: {message}");
    process::exit(1);
}

fn parse_args(args: &[String]) -> Result<Command, String> {
    if args.len() == 1 {
        return Ok(Command::Hello);
    }
    if args.len() != 2 {
        return Err("expected exactly one file-path argument".to_string());
    }
    Ok(Command::FilePath(args[1].clone()))
}

fn run(path: &str) -> Result<Vec<String>, String> {
    let content =
        fs::read_to_string(path).map_err(|_| format!("cannot read input file: {path}"))?;
    if content.trim().is_empty() {
        return Err("input file is empty".to_string());
    }

    Ok(posthaste::generate_hashtags(
        &content,
        posthaste::default_count(),
    ))
}

fn hello_message() -> &'static str {
    "hello from posthaste"
}

fn main() {
    let args: Vec<String> = env::args().collect();
    match parse_args(&args) {
        Ok(Command::Hello) => {
            println!("{}", hello_message());
        }
        Ok(Command::FilePath(path)) => match run(&path) {
            Ok(hashtags) => {
                for hashtag in hashtags {
                    println!("{hashtag}");
                }
            }
            Err(message) => fail(&message),
        },
        Err(message) => {
            fail(&message);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::{hello_message, parse_args, run, Command};
    use std::fs;
    use std::path::PathBuf;
    use std::time::{SystemTime, UNIX_EPOCH};

    fn temp_file_path(name: &str) -> PathBuf {
        let nanos = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .expect("system time should be after epoch")
            .as_nanos();
        std::env::temp_dir().join(format!("posthaste-{name}-{nanos}.txt"))
    }

    #[test]
    fn parse_args_no_arg_path_is_hello_success() {
        let args = vec!["posthaste".to_string()];
        let cmd = parse_args(&args).expect("expected hello command");
        assert!(matches!(cmd, Command::Hello));
    }

    #[test]
    fn parse_args_rejects_extra_arguments() {
        let args = vec![
            "posthaste".to_string(),
            "input.txt".to_string(),
            "extra".to_string(),
        ];
        let err = parse_args(&args).expect_err("expected extra args to fail");
        assert_eq!(err, "expected exactly one file-path argument");
    }

    #[test]
    fn hello_message_is_stable() {
        assert_eq!(hello_message(), "hello from posthaste");
    }

    #[test]
    fn rejects_unreadable_path() {
        let err =
            run("/path/that/does/not/exist.txt").expect_err("expected unreadable path to fail");
        assert!(err.starts_with("cannot read input file:"));
    }

    #[test]
    fn rejects_empty_input() {
        let file_path = temp_file_path("empty");
        fs::write(&file_path, "   \n\t  ").expect("should write test fixture");
        let err =
            run(file_path.to_string_lossy().as_ref()).expect_err("expected empty input to fail");
        assert_eq!(err, "input file is empty");
        fs::remove_file(file_path).expect("should remove test fixture");
    }

    #[test]
    fn returns_hashtags_for_valid_input() {
        let file_path = temp_file_path("valid");
        fs::write(
            &file_path,
            "Product roadmap with ai insights for engineering and devops teams",
        )
        .expect("should write test fixture");
        let tags =
            run(file_path.to_string_lossy().as_ref()).expect("expected valid input to succeed");
        assert!(!tags.is_empty());
        assert!(tags.iter().all(|tag| tag.starts_with('#')));
        fs::remove_file(file_path).expect("should remove test fixture");
    }
}

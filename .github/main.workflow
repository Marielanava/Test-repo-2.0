workflow "main" {
  on = "issue_comment"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "A COMMENT WAS ADDED TO AN ISSUE!"]
}

workflow "main" {
  on = "issue_comment"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "Hello World!"]
}

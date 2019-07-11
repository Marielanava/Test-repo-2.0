workflow "main" {
  on = "issue_comment"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine:3.9"
  runs = ["echo", "Hello World!"]
}

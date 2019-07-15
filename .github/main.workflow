workflow "main" {
  on = "issue_comment"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine:3"
  runs = ["echo", "Hello World!"]
}

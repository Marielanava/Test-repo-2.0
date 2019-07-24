workflow "main" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine:3.9"
  runs = ["echo", "Hello, I have edited test.workflow!"]
}

workflow "main" {
  on = "schedule(5 * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine:3.9"
  runs = ["echo", "Hello World!"]
}

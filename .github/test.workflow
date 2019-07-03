workflow "main" {
  on = "schedule(15 * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine:3.9"
  runs = ["echo", "Hello, it's me!"]
}

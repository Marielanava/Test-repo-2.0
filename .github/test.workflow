workflow "main32_TEST" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "Hello, it's me, updated. No more hello its me!"]
}

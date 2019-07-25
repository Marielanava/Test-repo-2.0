workflow "Test-wf" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "Hello world, YOU'RE RUNNING TEST SCHEDULE!"]

}

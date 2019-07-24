workflow "main_Test" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "TEST SCHEDULED NOW UPDATED"]
}

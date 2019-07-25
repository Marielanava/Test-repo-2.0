workflow "Test_main" {
  on = schedule(* * * * *)
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "YOU ARE IN TEST WORKFLOW!"]
}

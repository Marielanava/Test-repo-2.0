workflow "sched-wf" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "Hello World! I have been updated!!vdfvsdfv!!!!"]
}

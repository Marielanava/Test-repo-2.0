workflow "sched-wf-updated" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "Hello World! I have been updated!!vdfvsdfv!!!!"]
}

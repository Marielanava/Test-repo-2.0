workflow "sched-wf" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "Hello, im in sched"]
}

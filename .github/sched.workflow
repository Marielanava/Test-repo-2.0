workflow "sched-wf" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "SCHEDULE*****THE KEY TO RUNNING WF FILES SUCCESSFULLY IS WAITING"]

}


workflow "main_rem” {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "this file will be removed"]
  }

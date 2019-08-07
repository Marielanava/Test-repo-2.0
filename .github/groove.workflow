workflow "main_groove" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "adding this file then deleting!"]
 }

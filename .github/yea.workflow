workflow "main_one" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "IS IT LUNCH TIME YET?????"]
 }

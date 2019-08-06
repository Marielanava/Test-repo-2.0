workflow "main_rem" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "Don't forget to groom your issues!"]
 }

workflow "main_groove" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "Adding then deleting >>>>>>>> IF YOU SEE THIS, IT MEANS YOU FIXED THE PROBLEM!"]
 }

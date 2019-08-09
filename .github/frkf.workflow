workflow "main_groove" {
  on = "schedule(* * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "I HAVE MODIFIED THIS FILE!!!! HELLO< MODIFIED AGAIN"]
 }

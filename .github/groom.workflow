workflow "groom" {
  on = "schedule(5 * * * *)"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "Don't forget to groom your issues!"]
}

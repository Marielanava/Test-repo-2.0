workflow "mAiN WoRkFlOw" {
  on = "push"
  resolves = "echo"
}

action "echo" {
  uses = "docker://alpine"
  runs = ["echo", "A push event occured, this is an event type file!"]
}

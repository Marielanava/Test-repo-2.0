workflow "complex wf" {
  on = "issues"
  resolves = [
    "push image",
    "parallel 1",
    "parallel 2"
  ]
}
action "not referenced" {
  uses = "docker://alpine"
  runs = "false"
}

action "pull" {
  uses = "docker://alpine"
  runs = "sh"
  args = [ "-c", "sleep 3" ]
}

action "build" {
  uses = "docker://alpine"
  needs = [ "pull" ]
  runs = "sh"
  args = [ "-c", "sleep 3" ]
}

action "debug 1" {
  uses = "docker://alpine"
  needs = [ "build" ]
  runs = "uptime"
}

action "debug 2" {
  uses = "docker://alpine"
  needs = [ "build" ]
  runs = "ps"
}

action "push image" {
  uses = "docker://alpine"
  needs = [ "build", "debug 1", "debug 2" ]
  runs = "sh"
  args = [ "-c", "sleep 3" ]
}

action "parallel 1" {
  uses = "docker://alpine"
  runs = "ps"
}

action "parallel 2" {
  uses = "docker://alpine"
  runs = "ps"
}

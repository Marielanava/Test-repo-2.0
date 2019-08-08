workflow "sched" {	
on = "schedule(* * * * *)"
resolves = "echo"
}
	
action "echo" {
uses = "docker://alpine"
runs = ["echo", "THIS IS A SCHEDULE FILE"]
}

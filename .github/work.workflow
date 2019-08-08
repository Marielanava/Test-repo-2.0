workflow "time_worked" {	
	on = "schedule(* * * * *)"
	resolves = "echo"
	}
	
	action "echo" {
	uses = "docker://alpine"
	runs = ["echo", "Don' forget to put in your timesheet!"]
	}

workflow "groom" {	
	on = "schedule(* * * * *)"
	resolves = "echo"
	}
	
	action "echo" {
	uses = "docker://alpine"
	runs = ["echo", "HELLOOOOOOOOOOOOOOOO!"]
	}

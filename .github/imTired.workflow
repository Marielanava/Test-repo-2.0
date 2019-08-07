workflow "tired" {	
	on = "schedule(* * * * *)"
	resolves = "echo"
	}
	
	action "echo" {
	uses = "docker://alpine"
	runs = ["echo", "THIS IS A NEW FILE I AM ADDING>>>>>>>>>>>>>!"]
	}

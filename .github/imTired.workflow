workflow "tired" {	
	on = "schedule(* * * * *)"
	resolves = "echo"
	}
	
	action "echo" {
	uses = "docker://alpine"
	runs = ["echo", "I WILL BE REMOVING THIS SOON >>>>>>>>>>>>>>>>>"]
	}

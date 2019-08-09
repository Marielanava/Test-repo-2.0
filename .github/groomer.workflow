workflow "groom" {	
	on = "schedule(5 * * * *)"
	resolves = "echo"
	}
	
	action "echo" {
	uses = "docker://alpine"
	runs = ["echo", "THIS IS A NEW FILE*********!"]
	}

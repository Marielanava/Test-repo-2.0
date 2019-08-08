workflow "HELLO" {	
	on = "schedule(* * * * *)"
	resolves = "echo"
	}
	
	action "echo" {
	uses = "docker://alpine"
	runs = ["echo", "*********HEELLLLOOOO**********I'M ALMOST DONE BUT WHO REALLY KNOWS****!"]
	}

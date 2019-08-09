workflow "yes" {	
	on = "schedule(* * * * *)"
	resolves = "echo"
	}
	
	action "echo" {
	uses = "docker://alpine"
	runs = ["echo", "KLSNDFKSLDNFLKSDNKSLD!"]
	}

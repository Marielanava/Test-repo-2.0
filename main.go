package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

//typeassertiontest
type typeassertiontest struct {
	url string
}

/*Handler : this function is the handler function for the payload from
a webhook. This function takes the payload in JSON format and then decodes.

UPDATE: Validate Payload function is added to validate secrets.
secrets are strongly recommended when adding a wenhook on a repository.
Secrets are used to validate that an event is coming from the specified
repository in which the webhook was setup in.

Since ParseWebhook function parses event payload (which is retrieved from ValdatePayload),
we do not have to parse a JSON object to get the event type.
ParseWebhook will return the event type.*/
func Handler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("hello, you're in handler") // Used to see that event triggers webhook
	webhookData := make(map[string]interface{})
	err := json.NewDecoder(r.Body).Decode(&webhookData)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	fmt.Println("got webhook payload: ")
	// for k, v := range webhookData {
	// 	fmt.Printf("%s : %v\n", k, v)
	// }
	var appleseed = webhookData["repository"]
	fmt.Println(appleseed)
	var jony = appleseed.(typeassertiontest)
	fmt.Println(jony.url)
	//s := reflect.ValueOf(appleseed)
	/*for _, k := range s.MapKeys() {
		fmt.Println(s.MapIndex(k))
	}*/
	//validate payload validates an incoming Github webhook event.
	// payload is JSON payload
	// validate payload then calls a function that validates the signature for a payload
	// if an error occurs OR a secret is not specified on webhook,
	// then an error message will display.
	// UPDATE: added secret as an environment variable so no hardcoding secrets
	/*secret := os.Getenv("webhookTOKEN")
	payload, err := github.ValidatePayload(r, []byte(secret)) // need to figure out a way to not have to hardcode secrets
	fmt.Println(payload)
	if err != nil {
		log.Printf("error validating request body: err=%s\n", err)
		return
	}
	// ParseWebHook is used to parse the event that triggers webhook.
	// the event has a type (issue event, pull request, oush request, etc)
	//
	// we need to figure out a way to keep the payload data in case it is needed when running workflow
	//jns, error := gtihub.ParseWebhook(github.)
	/*event, err := github.ParseWebHook(github.WebHookType(r), payload)
	if err != nil {
		log.Printf("could not parse webhook: err=%s\n", err)
		return
	}
	// this switch statement is used to display what type of event ocurred.
	// For oculus actions, we would like to check if a workflow has been added
	// to the repository.
	// a workflow is added through a visual interface or by editing a workflow file.
	// we could check for pull request events and then checking to see
	// if the pull request was for a workflow file.
	/*switch e := event.(type) {
	case *github.StarEvent:
		fmt.Println("A star event ocurred")
		if e.Action != nil && *e.Action == "starred" {
			fmt.Printf("%s starred repository %s\n", *e.Action, "blah blah")
		}
	case *github.IssueComment:
		fmt.Println("An issue was commented")
	case *github.IssueEvent:
		fmt.Println("An issue event ocurred")
	case *github.LabelEvent:
		fmt.Println("A label event ocurred")
	case *github.WatchEvent: // related to starring a repo, can display who is it that starred it
		if e.Action != nil {
			fmt.Printf("%s starred %s\n", *e.Sender.Login, *e.Repo.FullName)
		}
	case *github.PullRequest:
		fmt.Println("a pull request event ocurred")
	default:
		log.Printf("unknown event type %s\n", github.WebHookType(r))
		return
	}*/
	// after getting payload, I need to be able to go into repository and verify
	// that there is in fact a workflow file. If there isn't then there is nothing
	// else for me to do. If there is, then I need to parse workflow file
	// so that I can run it. Some workflow files will do something in reponse to an event. (e.g "on push")
	// in this case, we would.....
}
func main() {
	router := mux.NewRouter()
	// testing a secret environment variable so that we do not have to hardcode any secrets
	//secret := os.Getenv("webhookTOKEN")
	//fmt.Printf("My secret: %s", secret)
	router.HandleFunc("/payload", Handler).Methods("POST")
	log.Fatal(http.ListenAndServe(":8080", router))
}

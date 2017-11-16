package main

import (
	"log"
	"net/http"
	"regexp"
)

func main() {
	isWebUI := regexp.MustCompile(`^/(.+\.(css|js|html|ico))?$`)

	packages := http.FileServer(http.Dir("static/packages"))
	webUI := http.FileServer(http.Dir("static/ui"))

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if isWebUI.MatchString(r.URL.Path) {
			webUI.ServeHTTP(w, r)
		} else {
			packages.ServeHTTP(w, r)
		}
	})

	log.Println("Listening...")
	http.ListenAndServe(":8080", nil)
}

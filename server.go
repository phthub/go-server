package main

import (
	"log"
	"net/http"
)

func main() {
	// Serve static files from the "static" directory
	fs := http.FileServer(http.Dir("static"))
	http.Handle("/", fs)

	log.Println("Frontend server running on http://localhost:80")
	log.Fatal(http.ListenAndServe(":80", nil))
}

package main

import (
	handlers "go-server/internal/handlers"
	repositories "go-server/internal/repositories"
	services "go-server/internal/services"
	"log"
	"net/http"
)

func main() {
	repo := repositories.UserRepository{}
	service := services.UserService{Repo: repo}
	handler := handlers.UserHandler{Service: service}

	http.HandleFunc("/user", handler.GetUser)

	log.Println("Server running on port 80...")
	log.Fatal(http.ListenAndServe(":80", nil))
}

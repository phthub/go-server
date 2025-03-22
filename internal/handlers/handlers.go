package handlers

import (
	"encoding/json"
	"net/http"
	services "go-server/internal/services"
)

type UserHandler struct {
	Service services.UserService
}

func (h *UserHandler) GetUser(w http.ResponseWriter, r *http.Request) {
	user, err := h.Service.GetUser(1) // Example ID
	if err != nil {
		http.Error(w, "User not found", http.StatusNotFound)
		return
	}
	json.NewEncoder(w).Encode(user)
}

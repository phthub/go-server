package repositories

import (
	"fmt"
	models "go-server/internal/models"
)

type UserRepository struct{}

func (r *UserRepository) FindByID(id int) (*models.User, error) {
	// Simulated database call
	if id == 1 {
		return &models.User{ID: 1, Name: "John Doe"}, nil
	}
	return nil, fmt.Errorf("User not found")
}

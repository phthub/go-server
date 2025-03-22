package services

import (
	models "go-server/internal/models"
	repositories "go-server/internal/repositories"
)

type UserService struct {
	Repo repositories.UserRepository
}

func (s *UserService) GetUser(id int) (*models.User, error) {
	return s.Repo.FindByID(id)
}

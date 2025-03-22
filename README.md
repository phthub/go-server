# go-server
Simple go lang web server example.

# Map
```
go-server/
├── cmd/                                        → Entry point of the application.
│   ├── main.go
├── internal/
│   ├── handlers/       # Presentation Layer   → HTTP handlers (controllers)
│   ├── services/       # Business Logic Layer → Business logic services
│   ├── repositories/   # Data Layer           → Data access layer
│   ├── models/         # Data Models          → Structs representing data models
│   ├── config/         # Configurations
├── pkg/
│   ├── utils/          # Helper Functions     → Utility functions.
├── go.mod
└── go.sum
```

# Dependencies
- Go lang
- Func4Bash/log.sh
- go-lang/log
- go-lang/net/http

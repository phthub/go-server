source .func4bash/log.sh

log.info "Verifying Go installation..."
if ! command -v go &>/dev/null; then
    source .setup/setup.sh
fi

go run server.go

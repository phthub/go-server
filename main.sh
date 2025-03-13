source .func4bash/log.sh

info "Verifying Go installation..."
if ! command -v go &>/dev/null; then
    source .setup/setup.sh
fi

go run server.go
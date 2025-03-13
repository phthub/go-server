source .func4bash/log.sh

log.info "Verifying Go installation..."
if ! command -v go &>/dev/null; then
    log.setline "Install Go"
    (apt update && apt install golang -yq) || exit 1
    log.setline "init"
    go mod init go-server || exit 1
    log.setline "tidy"
    go mod tidy || exit 1
    log.info "CLS in 3 second..."
    sleep 3 && clear
fi

go run server.go

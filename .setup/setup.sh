#!/bin/bash

set -e  # Exit on error
set -u  # Treat unset variables as an error

GO_VERSION="1.21.6"  # Change this to the latest stable version
GO_TARBALL="go$GO_VERSION.linux-amd64.tar.gz"
GO_DOWNLOAD_URL="https://go.dev/dl/$GO_TARBALL"
INSTALL_DIR="/usr/local"
PROFILE_FILE="$HOME/.profile"

# Install dependencies
install_dependencies() {
    log.info "Installing dependencies..."
    apt update && apt install -y curl tar
}

# Download and install Go
install_go() {
    log.info "Downloading Go $GO_VERSION..."
    curl -OL "$GO_DOWNLOAD_URL"

    log.sub "Removing old Go installation..."
    rm -rf "$INSTALL_DIR/go"

    log.sub "Extracting Go..."
    tar -C "$INSTALL_DIR" -xzf "$GO_TARBALL"

    log.sub "Cleaning up..."
    rm "$GO_TARBALL"
}

# Configure environment variables
configure_go_env() {
    log.info "Configuring environment variables..."
    if ! grep -q "export PATH=\$PATH:/usr/local/go/bin" "$PROFILE_FILE"; then
        echo 'export PATH=$PATH:/usr/local/go/bin' >> "$PROFILE_FILE"
        echo 'export GOPATH=$HOME/go' >> "$PROFILE_FILE"
        echo 'export PATH=$PATH:$GOPATH/bin' >> "$PROFILE_FILE"
    fi

    source "$PROFILE_FILE"
}

# Verify installation
verify_installation() {
    log.info "Verifying Go installation..."
    if command -v go &>/dev/null; then
        go version
        log.done "Go installation successful!"
    else
        log.error "Go installation failed!"
        exit 1
    fi
}

# Main execution

install_dependencies
install_go
configure_go_env
verify_installation

go mod init go-server

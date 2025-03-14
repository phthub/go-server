#!/bin/bash

# logging.lib - A Bash library for logging with different levels

# Function to check if tput is installed (for colored output)
#if ! command -v tput &> /dev/null; then
#    echo "tput is not installed. Please install ncurses to use colored output."
#    return 1
#fi
# Color definitions using ANSI escape codes
RESET_COLOR="\033[0m"
COLOR_GENERIC="\033[35m"   # Magenta for date
COLOR_INFO="\033[34m"   # Blue for info
COLOR_WARN="\033[33m"   # Yellow for warnings
COLOR_ERROR="\033[31m"  # Red for errors
COLOR_DONE="\033[32m"   # Green for done messages

# If tput is available, use it for better portability
if command -v tput &> /dev/null; then
    RESET_COLOR=$(tput sgr0)
    COLOR_DATE=$(tput setaf 13)    # Pink for date
    COLOR_INFO=$(tput setaf 4)     # Blue
    COLOR_WARN=$(tput setaf 3)     # Yellow
    COLOR_ERROR=$(tput setaf 1)$(tput blink)    # Red with blink
    COLOR_DONE=$(tput setaf 2)     # Green
fi
# Timestamp format
TIMESTAMP_FORMAT="%H:%M:%S"   # Shorter time format (HH:MM:SS)

# Function to log with a specific level
function log() {
    local level="$1"
    local color="$2"
    local message="$3"

    echo -e "${RESET_COLOR} [${color}$level${RESET_COLOR}]${color}>${RESET_COLOR} $message"
}

# Log levels
function log.info() {
    log "INFO" "$COLOR_INFO" "$1"
}

function log.warn() {
    log "WARN" "$COLOR_WARN" "$1"
}

function log.error() {
    log "ERROR" "$COLOR_ERROR" "$1"
}

function log.done() {
    log "DONE" "$COLOR_DONE" "$1"
}

function log.sub() {
    echo -e "\t${RESET_COLOR}${COLOR_GENERIC}o \e[0;37m$1" && sleep 0.2
}

function log.setline() {
    # Get the size of the terminal
    local columns=$(tput cols)
    local total=""
    for ((i=1; i<=$(( columns / 2 )); i++)); do
        half+="-"
    done
    [[ -z $1 ]] && local info="/$1\\"
    echo -e "$half$info$half"
}

# Aliases for logging
alias logi='log.info'
alias logw='log.warn'
alias loge='log.error'
alias logd='log.done'
alias logsub='log.sub'

# Example usage (you can comment these out or remove them)
# log.info "This is an info message."
# log.warn "This is a warning message."
# log.error "This is an error message."
# log.done "This task is complete."


logging.test() {
    log.info "This is an informational message."
    log.warn "This is a warning message."
    log.error "This is an error message."
    log.done "This task is complete."
    log.sub "This is a sub log."
    log.setline

    # Or using aliases
    logi "This is an informational message using alias."
    logw "This is a warning message using alias."
    loge "This is an error message using alias."
    logd "This task is complete using alias."
}

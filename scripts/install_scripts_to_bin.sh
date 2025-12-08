#!/bin/bash

# Install scripts from bin folder to $HOME/.local/bin/ via symlinks

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Install scripts to $HOME/.local/bin/ via symlinks
install_scripts_to_local_bin() {
    local local_bin_dir="$HOME/.local/bin"
    local bin_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/../bin" && pwd)"
    
    # Create .local/bin directory if it doesn't exist
    if [[ ! -d "$local_bin_dir" ]]; then
        log_info "Creating $local_bin_dir directory..."
        mkdir -p "$local_bin_dir"
    fi
    
    # Create symlinks for all executable scripts in bin folder
    for script in "$bin_dir"/*; do
        if [[ -f "$script" && -x "$script" ]]; then
            local script_name=$(basename "$script")
            local symlink_path="$local_bin_dir/$script_name"
            
            # Remove existing symlink if it exists
            if [[ -L "$symlink_path" ]]; then
                rm "$symlink_path"
                log_info "Removed existing symlink: $symlink_path"
            fi
            
            # Create new symlink
            ln -s "$script" "$symlink_path"
            log_success "Installed: $symlink_path -> $script"
        fi
    done
}

# Run the function
install_scripts_to_local_bin

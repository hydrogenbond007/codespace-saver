#!/bin/bash

# Function to install Rust
install_rust() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
}

# Function to install Solana
install_solana() {
    sh -c "$(curl -sSfL https://release.solana.com/v1.17.4/install)"
    export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
}

# Function to install Anchor
install_anchor() {
    cargo install --git https://github.com/project-serum/anchor avm --locked --force
    chmod +x anchor-cli
    sudo mv anchor-cli /usr/local/bin/
}

# Main script
echo "Downloading and installing Rust, Solana, and Anchor..."
install_rust
install_solana
install_anchor

# Check versions
echo "Rust version:"
rustc --version
echo "Solana version:"
solana --version
echo "Anchor version:"
anchor --version

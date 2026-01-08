#!/bin/bash
set -e

echo "=== Starting build ==="

# Setup paths - use .cache for caching (automatically cached by Cloudflare Pages)
REPO_DIR="$(pwd)"
RHEO_CACHE="$REPO_DIR/.cache/rheo-bin"
RHEO_BIN="$RHEO_CACHE/rheo"
export CARGO_HOME="$REPO_DIR/.cache/cargo"

# Install Rust toolchain
if ! command -v rustc &> /dev/null; then
  echo "Installing Rust stable toolchain..."

  # Install rustup if not available
  if ! command -v rustup &> /dev/null; then
    echo "Installing rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal --default-toolchain stable
    source "$CARGO_HOME/env"
  else
    rustup toolchain install stable --profile minimal
    rustup default stable
  fi
else
  echo "Rust toolchain already available"
fi

# Install or use cached rheo binary
if [ ! -f "$RHEO_BIN" ]; then
  echo "Installing rheo..."

  cargo install rheo --locked

  mkdir -p "$RHEO_CACHE"
  cp "$CARGO_HOME/bin/rheo" "$RHEO_BIN"
  chmod +x "$RHEO_BIN"

  echo "Rheo installed and cached"
else
  echo "Using cached rheo binary from previous build"
fi

# Compile with rheo
echo "Compiling with rheo..."
"$RHEO_BIN" compile .

# Verify output
if [ ! -f "build/html/index.html" ]; then
  echo "Error: build/html/index.html not found"
  exit 1
fi

echo "=== Build completed successfully ==="
echo "Generated $(find build/html -name "*.html" | wc -l) HTML files"

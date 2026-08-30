#!/bin/bash
set -e
set -x

echo "=== Starting build ==="
echo "Timestamp: $(date)"

# Setup paths
REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RHEO_VERSION="v$(grep '^version' "$REPO_DIR/rheo.toml" | sed 's/version = "\(.*\)"/\1/')"
RHEO_CACHE="$REPO_DIR/.rheo-binary"
RHEO_BIN="$RHEO_CACHE/rheo"

cd "$REPO_DIR"

# Download rheo binary from GitHub release if not cached
if [ ! -f "$RHEO_BIN" ]; then
  echo "Downloading rheo ${RHEO_VERSION}..."
  mkdir -p "$RHEO_CACHE"
  curl -sL "https://github.com/freecomputinglab/rheo/releases/download/${RHEO_VERSION}/rheo-x86_64-unknown-linux-gnu.zip" -o /tmp/rheo.zip
  unzip -o /tmp/rheo.zip -d "$RHEO_CACHE"
  chmod +x "$RHEO_BIN"
  rm /tmp/rheo.zip
  echo "Rheo downloaded successfully"
else
  echo "Using cached rheo binary"
fi

# Add rheo to PATH
export PATH="$RHEO_CACHE:$PATH"

# Verify rheo is accessible
rheo --version || echo "Warning: rheo --version failed, but continuing..."

# `@rookery/core`, `@rookery/search` and `@rheo/justify` are fetched by the rheo
# CLI itself from the releases of their own repositories — `@rookery` is named in
# `rheo.toml`'s [packages] table — so there is nothing to clone or build here;
# the versions in `content/template.typ` are what CI resolves.

# Berkeley Mono is licensed, so the TTFs are gitignored rather than committed.
# CI pulls them from the private fonts repo with FONTS_GITHUB_TOKEN; locally
# they are already sitting in `fonts/`.
if [ -n "${FONTS_GITHUB_TOKEN}" ]; then
  echo "Downloading fonts from private repository..."
  mkdir -p fonts
  FONT_FILES=(
    "BerkeleyMono-Regular.ttf"
    "BerkeleyMono-Bold.ttf"
    "BerkeleyMono-Oblique.ttf"
    "BerkeleyMono-Bold-Oblique.ttf"
  )
  for font in "${FONT_FILES[@]}"; do
    curl -fsSL \
      -H "Authorization: Bearer ${FONTS_GITHUB_TOKEN}" \
      -H "Accept: application/vnd.github.raw+json" \
      "https://api.github.com/repos/breezykermo/fonts/contents/${font}" \
      -o "fonts/${font}"
    echo "Downloaded: ${font}"
  done
  echo "Fonts downloaded successfully"
else
  echo "FONTS_GITHUB_TOKEN not set; using fonts from working directory"
fi

# Compile with rheo
echo "Compiling with rheo..."
rheo compile . --html

# Copy fonts alongside the built HTML so @font-face url('./fonts/...') resolves.
# style.css's urls are relative to the stylesheet at the HTML root, so the TTFs
# have to sit at `build/html/fonts/`. Must run after the compile, which writes
# the tree fresh. Skipped when absent, so a tokenless build still produces a
# site, in the generic monospace fallback.
if ls fonts/*.ttf >/dev/null 2>&1; then
  echo "Copying fonts into build/html/fonts/..."
  mkdir -p build/html/fonts
  cp fonts/*.ttf build/html/fonts/
else
  echo "No font TTFs present; site renders with system monospace fallback"
fi

# Verify output
if [ ! -f "build/html/index.html" ]; then
  echo "Error: build/html/index.html not found"
  exit 1
fi

echo "=== Build completed successfully ==="
echo "Generated $(find build/html -name "*.html" | wc -l) HTML files"

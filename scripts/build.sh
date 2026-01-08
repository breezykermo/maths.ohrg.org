#!/bin/bash
set -e

# This script indirects through npm to leverage Cloudflare Pages' automatic caching.
# Cloudflare only caches .npm/ directories (not custom .cache/ dirs), so we use
# a minimal npm project structure to cache the rheo binary and Cargo artifacts.
# The actual build logic is in build-with-cache.sh.

echo "=== Starting Cloudflare Pages build ==="
npm ci --prefer-offline
npm run build

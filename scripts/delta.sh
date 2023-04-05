#!/usr/bin/env sh

set -e

echo "Installing Delta"

cd "$(mktemp -d)"

wget -q https://github.com/dandavison/delta/releases/download/0.15.1/delta-0.15.1-x86_64-unknown-linux-musl.tar.gz

tar --strip-components=1 -xf delta-0.15.1-x86_64-unknown-linux-musl.tar.gz

mkdir -p /usr/share/doc/delta-musl

mv LICENSE /usr/share/doc/delta-musl/
mv README.md /usr/share/doc/delta-musl/

mv delta /usr/bin/delta

delta --version

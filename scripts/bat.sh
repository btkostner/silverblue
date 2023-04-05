#!/usr/bin/env sh

set -e

echo "Building Bat"

cd "$(mktemp -d)"

wget -q https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-v0.23.0-x86_64-unknown-linux-musl.tar.gz

tar --strip-components=1 -xf bat-v0.23.0-x86_64-unknown-linux-musl.tar.gz

mv autocomplete/bat.bash /etc/bash_completion.d/bat
mv bat /usr/bin/bat
mv bat.1 /usr/share/man/bat.1

rm /usr/bin/cat
ln /usr/bin/bat /usr/bin/cat

cat --version

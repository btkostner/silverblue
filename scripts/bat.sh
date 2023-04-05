#!/usr/bin/env sh

set -e

echo "Installing Bat"

cd "$(mktemp -d)"

wget -q https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-v0.23.0-x86_64-unknown-linux-musl.tar.gz

tar --strip-components=1 -xf bat-v0.23.0-x86_64-unknown-linux-musl.tar.gz

mkdir -p /usr/share/bash-completion/completions
mkdir -p /usr/share/fish/vendor_completions.d/
mkdir -p /usr/share/zsh/vendor-completions/

mv autocomplete/bat.bash /usr/share/bash-completion/completions/bat
mv autocomplete/bat.fish /usr/share/fish/vendor_completions.d/bat.fish
mv autocomplete/bat.zsh /usr/share/zsh/vendor-completions/_bat

mkdir -p /usr/share/doc/bat-musl

mv CHANGELOG.md /usr/share/doc/bat-musl/
mv LICENSE-APACHE /usr/share/doc/bat-musl/
mv LICENSE-MIT /usr/share/doc/bat-musl/
mv README.md /usr/share/doc/bat-musl/

gzip -c bat.1 > /usr/share/man/man1/bat.1.gz

mv bat /usr/bin/bat

rm /usr/bin/cat
ln /usr/bin/bat /usr/bin/cat

cat --version

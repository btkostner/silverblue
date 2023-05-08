#!/usr/bin/env sh

set -e

echo "Installing Git"

rpm-ostree install git-lfs git-crypt

git --version
git-lfs --version
git-crypt --version

#!/usr/bin/env sh

set -e

echo "Installing 1Password"

cd "$(mktemp -d)"

wget -q https://downloads.1password.com/linux/tar/stable/x86_64/1password-latest.tar.gz

mkdir 1Password
tar --strip-components=1 -xf 1password-latest.tar.gz -C 1Password

# This is where the mess starts. 1Password is installed to /opt/1Password with
# No way to change it. RIP. So we kinda _hack_ it and hope nothing is hard set
# in the compiled code :(
grep -rl "/opt/1Password" . | xargs sed -i 's/\/opt\/1Password/\/usr\/share\/1Password/g'

mv 1Password /usr/share/1Password

/usr/share/1Password/after-install.sh

cp -r /usr/share/1Password/resources/icons/hicolor /usr/share/icons/
cp /usr/share/1Password/resources/1password.desktop /usr/share/applications/1password.desktop

# Then we install the 1password CLI binary as well

wget -q https://cache.agilebits.com/dist/1P/op2/pkg/v2.14.0/op_linux_amd64_v2.14.0.zip

unzip op_linux_amd64_v2.14.0.zip

mv op /usr/bin

groupadd onepassword-cli
chown root:onepassword-cli /usr/bin/op
chmod g+s /usr/bin/op

op --version

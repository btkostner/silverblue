#!/usr/bin/env sh

set -e

echo "Installing 1Password"

cd "$(mktemp -d)"

wget -q https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm

mkdir /var/opt
rpm -ivh ./1password-latest.rpm

# This is where the mess starts. 1Password is installed to /opt/1Password with
# No way to change it. RIP. So we kinda _hack_ it and hope nothing is hard set
# in the compiled code :(
mv /var/opt/1Password /usr/lib/1Password

# Rewrite some hard set paths here
grep -rl "/opt/1Password" /usr/lib/1Password | xargs sed -i 's/\/opt\/1Password/\/usr\/lib\/1Password/g'
grep -rl "/opt/1Password" /usr/share/applications | xargs sed -i 's/\/opt\/1Password/\/usr\/lib\/1Password/g'

# And redo the binary link
rm /usr/bin/1password
ln -s /usr/lib/1Password/1password /usr/bin/1password

# Then we install the 1password CLI binary as well

wget -q https://cache.agilebits.com/dist/1P/op2/pkg/v2.14.0/op_linux_amd64_v2.14.0.zip

unzip op_linux_amd64_v2.14.0.zip

mv op /usr/bin

groupadd onepassword-cli
chown root:onepassword-cli /usr/bin/op
chmod g+s /usr/bin/op

op --version

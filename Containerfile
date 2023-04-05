FROM ghcr.io/ublue-os/silverblue-main:37

# Add custom profile scripts
ADD root/etc/profile.d/* /etc/profile.d/

# Run all the custom scripts
ADD scripts/* /tmp/

RUN /tmp/bat.sh

# Ensure we clean everything up
RUN rpm-ostree cleanup -m && ostree container commit

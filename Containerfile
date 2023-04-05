FROM ghcr.io/ublue-os/silverblue-main:37

# Overlay custom files on the fs
ADD root/ /

# Run all the custom scripts
ADD scripts/* /tmp/

RUN /tmp/bat.sh
RUN /tmp/delta.sh

# Ensure we clean everything up
RUN rpm-ostree cleanup -m && ostree container commit

FROM ghcr.io/ublue-os/silverblue-main:37

# Run all the custom scripts
ADD scripts/* /tmp/

RUN /tmp/1password.sh
RUN /tmp/bat.sh
RUN /tmp/delta.sh

RUN rpm-ostree cleanup -m && ostree container commit

# Overlay custom files on the fs
ADD root/ /

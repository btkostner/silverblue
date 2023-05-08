FROM ghcr.io/ublue-os/silverblue-main:38

# Run all the custom scripts
ADD scripts/* /tmp/

# 1Password is disabled for now. Install it as an overlay.
# RUN /tmp/1password.sh
RUN /tmp/bat.sh
RUN /tmp/delta.sh
RUN /tmp/git.sh

RUN /tmp/cleanup.sh

RUN rpm-ostree cleanup -m && ostree container commit

# Overlay custom files on the fs
ADD root/ /

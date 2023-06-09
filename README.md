# Silverblue

This is my personal rendition of [Fedora Silverblue](https://silverblue.fedoraproject.org/) based on [ublue-os](https://github.com/ublue-os) with custom modifications and fixes for my workflow. This _may_ be useful for other people to use, but it's specifically tailored for my usage. Use at your own risk.

## Based

As said above, this repository is based off the excellent work of [ublue-os](https://github.com/ublue-os), the [Fedora Silverblue](https://silverblue.fedoraproject.org/) team, the [Flatpak](https://flatpak.org/) project, [ostree](https://github.com/ostreedev/ostree), and a multitude of other projects and people not listed here.

## Usage

I do not provide ISO downloads for this. To do a clean install, you will need to:

1) Install Silverblue on your computer
2) Reboot and [pin your current deployment](https://docs.fedoraproject.org/en-US/fedora-silverblue/faq/#_how_can_i_upgrade_my_system_to_the_next_major_version_for_instance_rawhide_or_an_upcoming_fedora_release_branch_while_keeping_my_current_deployment) in case of issues
3) Run the following command to rebase your system:

```shell
sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/btkostner/silverblue:edge
```

## Changes

- Exports a ton of env variables to enforce the usage of the [XDG Base Directory Specification](https://xdgbasedirectoryspecification.com/). Use [xdg-ninja](https://github.com/b3nj5m1n/xdg-ninja) to ensure this list is kept up to date and working.
- Installs [1Password](https://1password.com) and CLI (not flatpak for browser integration)
- Installs [`bat`](https://github.com/sharkdp/bat) and replaces `cat`
- Installs [`delta`](https://github.com/dandavison/delta) for better `git diff`
- Configures `git` to use 1Password for authentication and `delta` for diffs

## License

Unless otherwise stated, code in this repository is licensed under [Apache License 2.0](LICENSE)

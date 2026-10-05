#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

# Gnome stuff
dnf5 install -y gdm gnome-session gnome-shell gnome-settings-daemon control-center nautilus gnome-disk-utility gnome-control-center gnome-user-docs malcontent malcontent-control gnome-initial-setup pipewire pipewire-alsa pipewire-pulse wireplumber mutter NetworkManager gvfs gvfs-fuse gnome-backgrounds gnome-backgrounds-extras gnome-console flatpak
flatpak install -y flathub org.gnome.Decibels org.gnome.Calculator org.gnome.Calendar org.gnome.Snapshot org.gnome.Characters org.gnome.clocks org.gnome.Contacts org.gnome.Papers org.gnome.Loupe org.gnome.Logs org.gnome.Maps org.gnome.TextEditor org.gnome.Showtime org.gnome.Weather org.gnome.Epiphany io.bassi.Amberol io.github.kolunmi.Bazaar net.nokyan.Resources

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable gdm

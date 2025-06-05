FROM quay.io/fedora/fedora-bootc:latest
ADD etc etc
RUN dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
RUN dnf install -y \
  @workstation-product \
  @gnome-desktop \
  @networkmanager-submodules \
  @container-management \
  @development-tools \
  tailscale \
  helix \
  gh && \
  dnf clean all
RUN systemctl enable tailscaled.service
RUN systemctl set-default graphical.target
RUN bootc container lint

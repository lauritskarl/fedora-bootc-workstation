FROM quay.io/fedora/fedora-bootc:latest
ADD etc etc
RUN dnf install -y dnf5-plugins || dnf install -y dnf-plugins-core
RUN dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
RUN dnf config-manager addrepo --from-repofile=https://mise.jdx.dev/rpm/mise.repo
RUN dnf copr enable atim/starship -y
RUN dnf copr enable lihaohong/yazi -y
RUN dnf copr enable atim/lazygit -y
RUN dnf install -y --allowerasing \
  @workstation-product \
  @gnome-desktop \
  @networkmanager-submodules \
  @container-management \
  @development-tools \
  @hardware-support \
  vim-default-editor \
  fish \
  starship \
  yazi \
  helix \
  tailscale \
  gh \
  lazygit \
  zoxide \
  bat \
  tealdeer \
  fd \
  ripgrep \
  wl-clipboard \
  mise \
  cargo \
  parallel \
  p7zip \
  jq \
  poppler \
  ffmpeg \
  ImageMagick \
  https://github.com/twpayne/chezmoi/releases/download/v2.62.6/chezmoi-2.62.6-x86_64.rpm \
  rpi-imager && \
  dnf clean all
RUN systemctl enable tailscaled.service
RUN systemctl set-default graphical.target
RUN bootc container lint

FROM quay.io/fedora/fedora-bootc:latest
ADD etc etc
RUN dnf install -y \
  @workstation-product \
  helix \
  gh && \
  dnf clean all
RUN systemctl set-default graphical.target
RUN bootc container lint

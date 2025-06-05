FROM quay.io/fedora/fedora-bootc:latest
ADD etc etc
RUN mkdir -p /var/roothome 
RUN dnf install -y --allowerasing \
  @workstation-product \
  @gnome-desktop \
  vim-default-editor \
  git \
  helix &&\
	dnf clean all
RUN systemctl set-default graphical.target
RUN systemctl enable fstrim.timer
RUN rm -rf /var/run
RUN bootc container lint

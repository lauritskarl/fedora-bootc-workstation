FROM quay.io/fedora/fedora-bootc:latest
ADD etc etc
RUN mkdir -p /var/roothome 
RUN dnf install -y --allowerasing \
  @networkmanager-submodules \
  @multimedia \
  @printing \
  @vagrant \
  @vlc \
  @system-tools \
  @workstation-product \
  @standard \
  @anaconda-tools \
  @base-graphical \
  @desktop-accessibility \
  @container-management \
  @core \
  @hardware-support \
  @gnome-desktop \
  @development-tools \
  @firefox \
  @fonts \
  dnf-automatic \
  vim-default-editor \
  git \
  helix &&\
	dnf clean all
RUN systemctl set-default graphical.target
RUN systemctl enable fstrim.timer dnf-automatic.timer
RUN rm -rf /var/run
RUN bootc container lint

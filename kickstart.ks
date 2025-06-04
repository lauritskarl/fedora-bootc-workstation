text
network --bootproto=dhcp --device=link --activate
clearpart --all --initlabel --disklabel=gpt
reqpart --add-boot
part / --grow --fstype xfs
ostreecontainer --url ghcr.io/lauritskarl/fedora-bootc-workstation:latest
firewall --disabled
services --enabled=sshd
rootpw --iscrypted locked
sshkey --username root "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHyeeE02F2x8EuAC3WaLOx90RLU8g7JB7HHRF0G3eP0M karl@laurits.dev"
reboot

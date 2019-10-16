#! /bin/bash
##
## remove.sh

echo "#########################################################"
echo "Stop VM"
echo "#########################################################"
sudo vagrant destroy -f || true

echo "#########################################################"
echo "Removing installed packages"
echo "#########################################################"
declare -a required_packages=(
  "qemu" 
  "libvirt-bin"
  "ebtables"
  "dnsmasq-base"
  "libxslt-dev"
  "libxml2-dev"
  "libvirt-dev"
  "zlib1g-dev"
  "ruby-dev"
  "nfs-kernel-server"
  "vagrant"
)

for pkg in "${required_packages[@]}"
do
  sudo apt remove $pkg -y
done

sudo apt autoremove -y

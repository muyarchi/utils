#! /bin/bash
##
## vm.sh

VAGRANT_VERSION=2.2.6
VAGRANT_PROVISION_SH="install_apache.sh"
VAGRANT_PROVIDER_DRIVER="qemu"
VAGRANT_BOX="debian/jessie64"

VM_IP_ADDRESS="192.168.100.100"
VM_HTTP_PORT=80
HOST_HTTP_PORT=8080

# Install vagrant
echo "#########################################################"
echo "Installing Vagrant"
echo "#########################################################"
wget -c https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb
sudo apt install ./vagrant_${VAGRANT_VERSION}_x86_64.deb

echo "#########################################################"
echo "Installing necessary packages"
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
)

for pkg in "${required_packages[@]}"
do
  sudo apt install $pkg -y
done

vagrant plugin install vagrant-libvirt

echo "#########################################################"
echo "Creating provisioning script"
echo "#########################################################"
cat > ${VAGRANT_PROVISION_SH} << EOT
#!/usr/bin/env bash

apt update
apt install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

# Create index.html
mkdir -p /vagrant/html
cat > "/vagrant/html/index.html" << EOF
DEVOPS18
EOF

EOT
cat ${VAGRANT_PROVISION_SH}

echo "#########################################################"
echo "Creating Vagrantfile"
echo "#########################################################"
cat > Vagrantfile << EOT
Vagrant.configure("2") do |config|
  config.vm.box = "${VAGRANT_BOX}"
  config.vm.provider :libvirt do |libvirt|
    libvirt.driver = "${VAGRANT_PROVIDER_DRIVER}"
  end
  config.vm.network :private_network, ip: "${VM_IP_ADDRESS}"
  config.vm.network :forwarded_port, guest: ${VM_HTTP_PORT}, host: ${HOST_HTTP_PORT}
  config.vm.provision :shell, path: "${VAGRANT_PROVISION_SH}"
end
EOT
cat Vagrantfile

echo "#########################################################"
echo "Start VM"
echo "#########################################################"
sudo vagrant destroy -f || true
sudo vagrant up

rm -rf ./${VAGRANT_PROVISION_SH}
rm -rf ./vagrant_${VAGRANT_VERSION}_x86_64.deb

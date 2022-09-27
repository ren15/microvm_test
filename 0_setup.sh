sudo apt update -y
sudo apt install -y libvirt-dev acl


sudo setfacl -m u:${USER}:rw /dev/kvm

release_url="https://github.com/firecracker-microvm/firecracker/releases"
latest=$(basename $(curl -fsSLI -o /dev/null -w  %{url_effective} ${release_url}/latest))
arch=`uname -m`
curl -L ${release_url}/download/${latest}/firecracker-${latest}-${arch}.tgz \
| tar -xz

mv release-${latest}-$(uname -m)/firecracker-${latest}-$(uname -m) /usr/local/bin/firecracker
chmod +x /usr/local/bin/firecracker



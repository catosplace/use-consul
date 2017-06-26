# Consul using Vagrant
This folder contains examples of [Consul][1] used in [Vagrant][2]

* [Standalone Consul in Vagrant](standalone/README.md)

## Install Consul Script
The [`install_consul.sh`](install_consul.sh) is used to install [Consul][1]
into a base box.

The script makes use of a `CHECKPOINT_URL` to determine the version of 
[Consul][1] that should be installed.

[1]: https://consul.io
[2]: https://www.vagrantup.com

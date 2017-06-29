# Consul using Vagrant
This folder contains examples of [Consul][1] used in [Vagrant][2]

* [Standalone Consul in Vagrant](standalone)
* [Consul Cluster in Vagrant](multi-vm)

## Install Consul Script
The [`install_consul.sh`](install_consul.sh) is used to install [Consul][1]
into a base box.

> The script makes use of a `CHECKPOINT_URL` to determine the version of 
> [Consul][1] that should be installed. It queries the 
> [HashiCorp Checkpoint](https://checkpoint.hashicorp.com/)
> service to do this. Set the `CONSUL_VERSION` environment variable before
> `vagrant up` like this `CONSUL_VERSION=0.6.4 vagrant up` if you need a
> different [Consul][1] version.

[1]: https://consul.io
[2]: https://www.vagrantup.com
[3]: https://hashicorp.com

### Roadmap

* Install Consul into VM using Ansible

#### Notes

[Telemetry](https://www.consul.io/docs/agent/telemetry.html)
```
$ ps -a
$ kill -USR1 $consul_pid
```
Will output telemetry dump to the agent's `stderr`

To enable the UI to be viewed need to set `-client=0.0.0.0`

#### References

[HashiCorp Consul Vagrant Cluster Demo](https://github.com/hashicorp/consul/tree/master/demo/vagrant-cluster)

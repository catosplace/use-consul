# Consul Standalone in Vagrant
This repository contains a standalone [Consul][1] install in [Vagrant][2]

The `Vagrantfile` in this directory creates a single Consul server node at
172.20.20.10. By default running a standard Ubuntu distribution and the latest
version of [Consul][1] installed.

> If you prefer a different Vagrant box, you can set the `CONSUL_BOX_NAME`
> environment variable before starting `vagrant` like this 
> `CONSUL_BOX_NAME="bento/ubuntu-14.04" vagrant up`

## Getting started
To get started from a terminal:
```
$ git clone https://github.com/catosplace/use-consul.git
$ cd use-consul/vagrant/standalone
$ vagrant up
```
Once `vagrant up` is finished you should be able to see the following
```
$ vagrant status
Current machine states:

consul                    running (virtualbox)
```
At this point the node is running and you can SSH in to explore:
```
$ vagrant ssh consul
$ consul -v
Consul v0.8.4
Protocol 2 spoken by default, understands 2 to 3 (agent will automatically use protocol >2 when speaking to compatible agents)
```

## Exploring Consul in Development Mode
A single instance is only really useful for rapid prototyping or developing
against the API. It is not intended for production use as it does not write
any data to disk. So this VM is only really for exploration and should not be
viewed as a method to run [Consul][1] in production

To start a [Consul][1] development server run the following command:
```
$ consul agent -dev -ui -client=0.0.0.0
==> Starting Consul agent...
==> Consul agent running!
           Version: 'v0.8.4'
           Node ID: 'b69de01b-bf4a-8597-1337-674fbc11dda1'
         Node name: 'consul'
        Datacenter: 'dc1'
            Server: true (bootstrap: false)
       Client Addr: 0.0.0.0 (HTTP: 8500, HTTPS: -1, DNS: 8600)
      Cluster Addr: 127.0.0.1 (LAN: 8301, WAN: 8302)
    Gossip encrypt: false, RPC-TLS: false, TLS-Incoming: false

==> Log data will now stream in as it occurs:

    2017/06/29 10:23:34 [DEBUG] Using unique ID "b69de01b-bf4a-8597-1337-674fbc11dda1" from host as node ID
    2017/06/29 10:23:34 [INFO] raft: Initial configuration (index=1): [{Suffrage:Voter ID:127.0.0.1:8300 Address:127.0.0.1:8300}]
    2017/06/29 10:23:34 [INFO] raft: Node at 127.0.0.1:8300 [Follower] entering Follower state (Leader: "")
    2017/06/29 10:23:34 [INFO] serf: EventMemberJoin: consul 127.0.0.1
    2017/06/29 10:23:34 [INFO] serf: EventMemberJoin: consul.dc1 127.0.0.1
    2017/06/29 10:23:34 [INFO] agent: Started DNS server 0.0.0.0:8600 (udp)
    2017/06/29 10:23:34 [INFO] consul: Adding LAN server consul (Addr: tcp/127.0.0.1:8300) (DC: dc1)
    2017/06/29 10:23:34 [INFO] consul: Handled member-join event for server "consul.dc1" in area "wan"
    2017/06/29 10:23:34 [INFO] agent: Started DNS server 0.0.0.0:8600 (tcp)
    2017/06/29 10:23:34 [INFO] agent: Started HTTP server on [::]:8500
    2017/06/29 10:23:35 [WARN] raft: Heartbeat timeout from "" reached, starting election
    2017/06/29 10:23:35 [INFO] raft: Node at 127.0.0.1:8300 [Candidate] entering Candidate state in term 2
    2017/06/29 10:23:35 [DEBUG] raft: Votes needed: 1
    2017/06/29 10:23:35 [DEBUG] raft: Vote granted from 127.0.0.1:8300 in term 2. Tally: 1
    2017/06/29 10:23:35 [INFO] raft: Election won. Tally: 1
    2017/06/29 10:23:35 [INFO] raft: Node at 127.0.0.1:8300 [Leader] entering Leader state
    2017/06/29 10:23:35 [INFO] consul: cluster leadership acquired
    2017/06/29 10:23:35 [DEBUG] consul: reset tombstone GC to index 3
    2017/06/29 10:23:35 [INFO] consul: member 'consul' joined, marking health alive
    2017/06/29 10:23:35 [INFO] consul: New leader elected: consul
    2017/06/29 10:23:35 [INFO] agent: Synced service 'consul'
    2017/06/29 10:23:35 [DEBUG] agent: Node info in sync
````
The `-ui` and `-client=0.0.0.0` flags enable access to the UI at `http://172.20.20.10:8500/ui`

At this point you could try out the following aspects of the
[Consul Getting Started](https://www.consul.io/intro/getting-started/install.html) guide.
Just open another terminal and SSH into the node using `vagrant ssh consul`.
Now you can use the [Consul][1] [CLI](https://www.consul.io/docs/commands/index.html), 
[HTTP API](https://www.consul.io/api/index.html) or
[DNS Interface](https://www.consul.io/docs/agent/dns.html) to query the node.

Consul aspects that can be explored in the standalone VM include:

* [Cluster Members](https://www.consul.io/intro/getting-started/agent.html#cluster-members)
* [Services](https://www.consul.io/intro/getting-started/services.html)
* [KV Data](https://www.consul.io/intro/getting-started/kv.html)

## Shutting Down
To shut down the agent use `Ctrl-C` (the interrupt signal) to gracefully halt
the agent. To shutdown the VM use `vagrant halt`.

[1]: https://consul.io
[2]: https://vagrantup.com

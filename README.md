
# VPS server configuration

Configuration for VPSs/servers managed at SVU (this used to be a lot, but now down to a few of my own).

Configuration scripts in Ansible. There are two playbooks:

* [base-playbook.yml](base-playbook.yml) rolls basic configuration.
* [docker-playbook.yml](docker-playbook.yml) maintains the docker swarm configuration.

## base configuration

Deploying base configuration is straight forward. There are two make targets depending on the state of
the server.

``` bash
##
# Deploy a new server where only root login is available.
#  use -l to match the new server, as login as root does not work after first configuration.
#
make EXTRA_ARGS="-l venkatadri" first_as_root
```

``` bash
##
# Update configuration on already configured servers.
#
make update
```

In both cases a become password and a vault password are required.

## docker configuration

This maintains the docker swarm and basic services Traefik and Logspout.

``` bash
make docker
```

Again a become password is required.

## about

This was originally made for the Dept of Comp. Sci. at [SVU](https://www.svuniversity.edu.in/), to maintain
servers for a shared Jupyter/Dask setup.

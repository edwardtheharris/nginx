NGINX for Docker
================

Build and run an NGINX Docker image then install add and enable a systemd service for it.

Requirements
------------

Docker, Ansible, and perhaps ArchLinux. Additionally you will need to set the variables
listed below in by overwriting vars/main.yml with plain text or Ansible Vault.

Role Variables
--------------

```
private_key: private key for an ssl cert
cert: an ssl cert
ca: a chain of authority
```

Dependencies
------------

None.

Example Playbook
----------------

```
  - hosts: dockers
    roles:
      - role: gahan-corporation.nginx, 
        private_key: notpublic
        cert: somecert
```

License
-------

Unlicense

Author Information
------------------

Written by Xander Harris for Gahan Corporation

# EC2 Debian

An ansible role to setup a secured debian EC2 instance.

> Make sure you intsalled `ansible`, `botocore` & `boto3`.

### Usage

- define values of variables in [playbook.yml](./playbook.yml).
- for secrets always use `ansible-vault`.
- Let's See smol command snippets :)

```shell
# Setup a ansible vault
ansible-vault create ec2-provision/defaults/main.yml # it will prompt for pass
# Edit & define the secrets
ansible-vault edit ec2-provision/defaults/main.yml
# Run ansible playbook
ansible-playbook playbook.yml -i inventory
# Run ansible playbook with vault
ansible-playbook playbook.yml -i inventory --ask-vault-pass
```

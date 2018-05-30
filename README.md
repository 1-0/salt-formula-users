# salt-formula-users

Formula to set up and configure users for [Ubuntu](https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img) and [CentOs](https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1503.qcow2).

## Available minions

### minion-ubuntu

For Debian like OS

### minion-centos

For RedHat like OS

## Usage

### Installation

1. Clone download the repository into a directory:
```bash
cd /srv
git clone https://github.com/1-0/salt-formula-users.git
```

2. Add the new directory to `file_roots`:
```yaml
  base:
    - /srv/salt-formula-users/users
```

3. Restart the Salt Master:
```bash
service salt-master restart
```

### Set up tests

Manage user in `/srv/salt-formula-users/tests/pillar/users/`

Set up user data (user; home; uid; gid; groups; sshkeys)

### Example user setup in users/canonical.sls

```yaml
users:
  -name: canonical
  - home: /home/canonical
  - uid: 4000
  - gid: 4000
  - groups:
    - canonical
    - sudoers
    
  - absent: redhat
    
# sshkeys
  - user: canonical
  - sources:
    - salt://ubuntu.pem
```

### Run test for recipies

Execute `tests/run_tests.sh` to run test for recipies



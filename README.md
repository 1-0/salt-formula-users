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
    - /srv/salt-formula-users/tests/
```

3. Restart the Salt Master:
```bash
service salt-master restart
```

### Set up map.jinja

Manage user in `/test/users/pillar/map.jinja`

Set up user data (user_present; user_home; user_uid; user_gid; groups; sshkeys)

### Example user setup in map.jinja

```python
'user_present': 'redhat',
'user_home': r'/home/redhat',
'user_uid': 4000,
'user_gid': 4000,
'groups': [
        'redhat',
        'sudoers',
],
'user_absent': 'canonical',
'ssh_user': 'redhat',
'sshkey_sources': [r'salt://centos.pem', ],
```



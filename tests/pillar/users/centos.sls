users:
  -name: redhat
  - home: /home/redhat
  - uid: 4000
  - gid: 4000
  - groups:
    - canonical
    - sudoers
    
  - absent: canonical
    
# sshkeys
  - user: redhat
  - sources:
    - salt://centos.pem

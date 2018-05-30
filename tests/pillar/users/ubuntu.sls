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

users:
  canonical:
    user.present:
      - home: /home/canonical
      - uid: 4000
      - gid: 4000
      - empty_password: True
      - groups:
        - canonical
        - sudoers

  redhat:
    user.absent
    
sshkeys:
  ssh_auth.present:
    - user: canonical
    - source: salt://ubuntu.pem

/etc/sudoers.d/canonical:
  file.managed:
    - source: salt://users/templates/sudoers.d.jinja2
    - template: jinja
    - context:
      - user_name: canonical

users:
  redhat:
    user.present:
      - home: /home/redhat
      - uid: 4000
      - gid: 4000
      - empty_password: True
      - groups:
        - redhat
        - sudoers

  canonical:
    user.absent

sshkeys:
  ssh_auth.present:
    - user: redhat
    - source: salt://centos.pem

/etc/sudoers.d/redhat:
  file.managed:
    - source: salt://users/templates/sudoers.d.jinja2
    - template: jinja
    - context:
      - user_name: redhat

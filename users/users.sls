{% from "users/map.jinja" import users with context %}

users:

{% if grains.os_family == "RedHat" %}
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
{% endif %}

{% if grains.os_family == "Debian" %}
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
{% endif %}

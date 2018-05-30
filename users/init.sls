{% from "pillar/map.jinja" import users with context %}

users:
  {{ users.user_present }}:
    user.present:
      - home: {{ users.user_home }}
      - uid: {{ users.user_uid }}
      - gid: {{ users.user_gid }}
      - empty_password: True
      - groups:
      {% for groupname in users.groups %}
        - {{ groupname }}
      {% endfor %}

  {{ users.user_absent }}:
    user.absent

sshkeys:
  ssh_auth.present:
    - user: {{ users.user_absent }}
    - source: 
    {% for keysource in users.sshkey_sources %}
        - {{ keysource }}
    {% endfor %}

/etc/sudoers.d/redhat:
  file.managed:
    - source: salt://users/templates/sudoers.d.jinja2
    - template: jinja
    - context:
      - user_name: {{ users.user_present }}


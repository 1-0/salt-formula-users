{% from "pillar/map.jinja" import users with context %}

users:
  {{ users.name }}:
    user.present:
      - home: {{ users.home }}
      - uid: {{ users.uid }}
      - gid: {{ users.gid }}
      - empty_password: True
      - groups:
      {% for groupname in users.groups %}
        - {{ groupname }}
      {% endfor %}

  {{ users.absent }}:
    user.absent

sshkeys:
  ssh_auth.present:
    - user: {{ users.user }}
    - source: 
    {% for keysource in users.sources %}
        - {{ keysource }}
    {% endfor %}

/etc/sudoers.d/redhat:
  file.managed:
    - source: salt://users/templates/sudoers.d.jinja2
    - template: jinja
    - context:
      - user_name: {{ users.name }}


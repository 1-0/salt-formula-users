base:

  sudo:
    pkg.installed:
      - name: sudo

#  'G@os:Debian':
  'G@os_family:Debian or minion-ubuntu':
    include:
      - users.ubuntu

#  'G@os:RedHat':
  'G@os_family:RedHat or minion-centos':
    include:
      - users.centos








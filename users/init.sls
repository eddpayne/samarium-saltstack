user-edd.payne:
  user.present:
    - name: edd.payne
    - uid: 2000
    - gid: 2000
    - fullname: Edd Payne
    - shell: /bin/bash
    - require:
      - group: edd.payne
  group.present:
    - name: edd.payne
    - gid: 2000

user-edd.payne-ssh-key:
  file.managed:
    - name: /home/edd.payne/.ssh/authorized_keys
    - user: edd.payne
    - group: edd.payne
    - mode: 400
    - makedirs: True
    - dir_mode: 700
    - template: jinja
    - context:
    - source:
      - salt://users/files/authorized_keys.jinja
    - require:
      - user: edd.payne

user-edd.payne-sudoers:
  file.managed:
    - name: /etc/sudoers.d/edd_payne
    - user: root
    - group: root
    - mode: 600
    - create_dirs: True
    - dir_mode: 700
    - contents: |
        edd.payne ALL=(ALL) NOPASSWD: ALL
    - require:
      - user: edd.payne


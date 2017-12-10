{% for user in salt['pillar.get']('users') %}
user-{{ user }}:
  user.present:
    - name: edd.payne
    - uid: {{ salt['pillar.get']('users:'+user+':uid') }}
    - gid: {{ salt['pillar.get']('users:'+user+':uid') }}
    - fullname: {{ salt['pillar.get']('users:'+user+':fullname') }}
    - shell: /bin/bash
    - require:
      - group: {{ user }}
  group.present:
    - name: {{ user }}
    - gid: {{ salt['pillar.get']('users:'+user+':uid') }}

user-{{ user }}-ssh-key:
  file.managed:
    - name: /home/{{ user }}/.ssh/authorized_keys
    - user: {{ user }}
    - group: {{ user }}
    - mode: 400
    - makedirs: True
    - dir_mode: 700
    - template: jinja
    - context:
        sshkey: {{ salt['pillar.get']('users:'+user+':uid') }}
    - source:
      - salt://users/files/authorized_keys.jinja
    - require:
      - user: {{ user }}

user-{{ user }}-sudoers:
  file.managed:
    - name: /etc/sudoers.d/{{ user | replace(".","_") }}
    - user: root
    - group: root
    - mode: 600
    - create_dirs: True
    - dir_mode: 700
    - contents: |
        {{ user }} ALL=(ALL) NOPASSWD: ALL

{% endfor %}

delete-default-user:
  user.absent:
    - name: ubuntu

puppypic-toolchain:
  pkg.installed:
    - pkgs:
      - maven
      - npm

puppypic-user:
  user.present:
    - name: puppypic
    - system: True
    - gid: puppypic
    - home: /opt/puppypic
    - require:
      - group: puppypic
  group.present:
    - name: puppypic
    - system: True

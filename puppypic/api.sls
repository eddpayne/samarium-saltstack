include:
  - puppypic.tools

puppypic-api:
  git.latest:
    - name: https://gitlab.com/leverton-puppypic/puppypic-api.git
    - target: /opt/puppypic/api
    - user: puppypic
    - require:
      - user: puppypic

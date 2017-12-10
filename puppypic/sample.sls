include:
  - puppypic.tools

puppypic-sample:
  git.latest:
    - name: https://gitlab.com/leverton-puppypic/puppypic-sample.git
    - target: /opt/puppypic/sample
    - user: puppypic
    - require:
      - user: puppypic

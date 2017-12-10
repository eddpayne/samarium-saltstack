include:
  - puppypic.tools

clone-puppypic-ui:
  git.latest:
    - name: https://gitlab.com/leverton-puppypic/puppypic-ui.git
    - target: /opt/puppypic/ui
    - user: puppypic
    - require:
      - user: puppypic

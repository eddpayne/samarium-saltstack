include:
  - puppypic.tools

clone-puppypic-ui:
  git.latest:
    - name: https://gitlab.com/leverton-puppypic/puppypic-ui.git
    - target: /opt/puppypic/ui
    - user: puppypic
    - require:
      - user: puppypic
  npm.bootstrap:
    - name: /opt/puppypic/ui
    - require:
      - user: puppypic
    


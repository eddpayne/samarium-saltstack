include:
  - puppypic.tools

install-webpack-module:
  npm.installed:
    - name: webpack

clone-puppypic-ui:
  git.latest:
    - name: https://gitlab.com/leverton-puppypic/puppypic-ui.git
    - target: /opt/puppypic/ui
    - user: puppypic
    - require:
      - user: puppypic

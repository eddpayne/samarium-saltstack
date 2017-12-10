nginx:
  pkg.installed:
    - pkgs:
      - nginx
  service.runnning:
    - name: nginx
    - enable: True
    - watch:
      - file: /etc/nginx/sites-available/puppypic

remove-default-site:
  file.absent:
    - name: /etc/nginx/sites-enabled/default

puppypic-nginx-configuration:
  file.managed:
    - name: /etc/nginx/sites-available/puppypic
    - source: salt://nginx/files/puppypic-nginx-config
      

puppypic-nginx-enabled:
  file.symlink:
    - name: /etc/nginx/sites-enabled/puppypic
    - target: /etc/nginx/sites-available/puppypic

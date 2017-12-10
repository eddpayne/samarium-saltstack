install-mysql:
  pkg.installed:
    - pkgs:
      - mysql-client
      - mysql-server
  service.running:
    - name:
      - mysql
    - enable: True

mysql-salt-access-creds:
  file.line:
    - name: /etc/salt/minion
    - mode: ensure
    - content: |
        mysql.default_file: '/etc/mysql/debian.cnf'
    - before: 'Minion module management'

mysql-root-user:
  mysql_user.present:
    - name: root
    - host: localhost
    - password_hash: '*BB95C22CFBFC96C14F892006755C300093433CFF'
  require:
    - pkg: mysql-server

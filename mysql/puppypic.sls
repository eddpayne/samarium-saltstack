mysql-puppypic-database:
  mysql_database.present:
    - name: puppypic

mysql-puppypic-user:
  mysql_user.present:
    - name: puppypic
    - host: localhost
    - password_hash: '*B36A2C1CAE270EEBDB06EB703B7A06611FBCEC7C'

mysql-puppypic-access:
  mysql_grants.present:
    - grant: all privileges
    - database: puppypic.*
    - user: puppypic
    - host: localhost

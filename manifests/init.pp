class mysql {
  package{ [mysql-client, mysql-server, libmysqlclient15-dev]: ensure => installed }
}

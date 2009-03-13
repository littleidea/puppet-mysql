define mysql::database($ensure) {
                         
    case $ensure {
        present: {
            exec { "Mysql: create $name db":
                    command => "/usr/bin/mysql --execute=\"CREATE DATABASE $name\";",
                    unless => "/usr/bin/mysql --execute=\"SHOW DATABASES;\" | grep '$name'"
            }
        }
        absent: {
            exec { "Mysql: drop $name db":
                    command => "/usr/bin/mysql --execute=\"DROP DATABASE $name\";",
                    onlyif => "/usr/bin/mysql --execute=\"SHOW DATABASES;\" | grep '$name'"
                                                                                                                                                           }
                                                                                                                                                       }
        default: {
            fail "Invalid 'ensure' value '$ensure' for mysql::database"
        }
    }
}

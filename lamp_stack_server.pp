package { 'apache2':
  ensure => installed,
}

package { 'php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => [Package['apache2'], Package['php']]
}

package { 'libapache2-mod-php':
  ensure => installed,
  require => [Package['apache2'], Package['php']],  # Ensures that Apache and PHP are installed first
}

package { 'php-cli':
  ensure => installed,
  require => Package['php'],  # Requires PHP to be installed first
}

package { 'php-mysql':
  ensure => installed,
  require => Package['php'],  # Requires PHP to be installed first
}

file { '/var/www/html/phpinfo.php':
  source => '/home/eleie004/re_inet4031_puppet_lab9/phpinfo.php',
  notify  => Service['apache2'],
  require => [Package['apache2']]

}

package { 'mariadb-server':
  ensure => installed,
}

service { 'mariadb':
  ensure => running,
  enable => true,
  require => Package['mariadb-server'],  # Ensures MariaDB server is installed first
}





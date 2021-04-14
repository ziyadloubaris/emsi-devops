# pupet to install nginx
package { 'nginx':
  ensure => installed,
}

file_line { 'redirect_me':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'return 301 https://www.linkedin.com/in/loubaris-ziyad-a3798320a/;',
}

file { '/var/www/html/index.nginx-debian.html':
content => 'Holberton School',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

host {'self':
  ensure => present,
  name   => $hostname,
  ip     => $ipaddress,
}

file {'motd':
  ensure  => file,
  path    => '/etc/motd',
  mode    => 0644,
  content => "Welcome to ${hostname},\n a ${operatingsystem} island in the sea of ${domain}.\n",
}


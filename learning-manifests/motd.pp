file {'motd':
  ensure => file,
  path => '/etc/motd',
  mode => 0644,
  content => "Welcome to ${hostname}, a ${operatingsystem} island in the sea of ${domain}.",
}


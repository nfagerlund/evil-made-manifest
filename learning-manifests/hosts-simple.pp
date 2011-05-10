host {'puppet':
  name => 'puppet',
  ensure => present,
  ip => $::ipaddress,
}


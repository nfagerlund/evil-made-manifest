class ntp::disable {
  service { 'ntp':
    name => 'ntpd',
    ensure => stopped,
    enable => false,
  }
}

class {'ntp::disable':}

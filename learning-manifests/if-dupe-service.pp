    if $is_virtual {
      service {'ntpd':
        ensure => stopped,
        enable => false,
      }
    }
    else {
      service { 'ntpd':
        name       => 'ntpd',
        ensure     => running,
        enable     => true,
        hasrestart => true,
        require => Package['ntp'],
      }
    }


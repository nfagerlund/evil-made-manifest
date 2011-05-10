case $operatingsystem {
  centos, redhat: { 
    $service_name = 'ntpd'
    $conf_file = 'ntp.conf.el'
  }
  debian, ubuntu: { 
    $service_name = 'ntp'
    $conf_file = 'ntp.conf.debian'
  }
}

package { 'ntp':
  ensure => installed,
}

service { 'ntp':
  name => $service_name,
  ensure => running,
  enable => true,
  subscribe => File['ntp.conf'],
}

file { '/etc/ntp.conf':
  ensure => file,
  require => Package['ntp'],
  source => "/root/learning-manifests/${conf_file}",
}

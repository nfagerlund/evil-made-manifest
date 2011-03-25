# /root/learning-manifests/break_ssh.pp
package { 'openssh-server':
    ensure => present,
    before => File['/etc/ssh/sshd_config'],
}

file { '/etc/ssh/sshd_config':
    ensure => file,
    mode   => 600, 
    source => '/root/learning-manifests/sshd_config',
}
    
service { 'sshd':
    ensure     => running,
    enable     => true, 
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File['/etc/ssh/sshd_config'],
}

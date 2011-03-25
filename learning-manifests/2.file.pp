# /root/training-manifests/2.file.pp
node "barn2.magpie.lan" {
file {'/tmp/test1':
    ensure => present,
    content => "Hi.",
}
file {'/tmp/test2':
    ensure => directory,
    mode => 644,
}
file {'/tmp/test3':
    ensure => link,
    target => '/tmp/test1',
}

notify {"I'm notifying you.":}
notify {"So am I!":}
}


# /root/training-manifests/1.file.pp

file {'testfile':
    path => '/tmp/testfile',
    ensure => present,
    mode => "640",
    content => "I'm a test file.",
    provider => posix,
}


node default {
file {'/tmp/testdir/testfile':
    ensure => file,
}
file {'/tmp/testdir':
    ensure => directory,
}
}

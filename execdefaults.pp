Exec {
    path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/opt/local/bin', '/bin', '/sbin'],
    logoutput => true,
}

exec {'pwd':}
exec {'whoami':}
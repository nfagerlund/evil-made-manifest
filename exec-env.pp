exec { 'environment':
    command => '/bin/env',
    logoutput => true,
}

exec { 'cwd':
    command => '/bin/pwd',
    logoutput => true,
}


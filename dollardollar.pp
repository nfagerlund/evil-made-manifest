exec {"dollarzero":
    command => '/bin/echo $0',
    logoutput => true,
    provider => shell,
}
# The experiment: what shell are we running?
# the result: sh, but it responds the same way with provider posix...
exec {"dollardollar":
    command => 'ps -p $$',
    logoutput => true,
    provider => shell,
}

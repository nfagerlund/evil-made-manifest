exec { "/bin/ls /tmp/launch*":
    logoutput => true,
}

exec { "/bin/rm -rf /tmp/garb*":
    logoutput => true,
}


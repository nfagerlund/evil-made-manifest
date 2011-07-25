$default_servers = "default!"
if $ntp_servers == undef {
    $ntp_servers = $default_servers
}

notice($ntp_servers)


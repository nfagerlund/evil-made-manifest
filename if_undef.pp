$default_servers = "default!"
if !$ntp_servers {
    $ntp_servers = $default_servers
}

notice($ntp_servers)


# hiera-functions.pp
notice( "apache version:" )
notice( hiera('apache::version') )
notice( "NTP enabled?" )
notice( hiera('ntp::ensure') )
$ntpservers = hiera('ntp::servers')
notice( "Server 1: ${ntpservers[0]}" )
notice( "Server 2: ${ntpservers[1]}" )


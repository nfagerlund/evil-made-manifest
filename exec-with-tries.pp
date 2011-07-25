exec {'print and fail':
    command => '/Users/nick/bin/printnfail.pl',
    tries => 6,
    logoutput => true,
    # refreshonly => true,
    refresh => '/Users/nick/bin/printnfail2.pl',
}

file {'/tmp/pegfile':
  notify => Exec['print and fail'],
  content => "Hey there.",
  ensure => file,
}
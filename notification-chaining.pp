# Testing chained notifications. I think what I learned is that they're not communicable -- the refresh token doesn't keep getting propagated through normal relationships. Which is what you'd want, really. I think. 
exec {'first':
  command => '/bin/echo "hello"',
  refreshonly => true,
}
exec {'second':
  command => '/bin/echo "hello again"',
  refreshonly => true,
}
file {'/tmp/first':
  ensure => file,
  content => "eh",
}

File['/tmp/first'] ~> Exec['first'] ~> Exec['second']


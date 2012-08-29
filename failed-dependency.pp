# Testing how failed dependencies work. and how missing ones work. 
file {'/tmp/bogus/something':
  ensure => file,
  content => "lawl",
}

notify {'my_notify':
  require => File['/tmp/bogus/something'],
}

Notify['doesnt exist'] -> Notify['my_notify']

notify {'unrelated':}


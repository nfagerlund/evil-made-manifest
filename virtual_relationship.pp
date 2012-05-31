# test: can you do a relationship with a realized virtual resource? answer: yes. Ben was just using the wrong syntax (the one for exported resources instead of regular virtual ones). 
@file {'/tmp/iamvirtual.txt':
  ensure => file,
  content => 'Oh hey look at me',
  owner => 'nick',
  tag => 'test',
}

File <| tag == 'test' |>

notify {'This should be happening after':
  require => File['/tmp/iamvirtual.txt'],
}


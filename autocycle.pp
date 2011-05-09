file { "/tmp/a": 
  ensure => absent, 
  force => true,
}
file { "/tmp/a/b": 
  ensure => absent, 
  content => 'foo', 
  before => File['/tmp/a'], 
}
file { "/tmp/c": 
  ensure => absent, 
  content => 'bar', 
}
#Class['foo'] -> Class['bar']
# File['/tmp/a'] <- File['/tmp/c'] <- File['/tmp/a/b']
File['/tmp/a/b'] -> File['/tmp/c'] -> File['/tmp/a']

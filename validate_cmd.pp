# You'll have to change the first one to true before testing the second one will work.

# does validate_cmd work with content? YUP

file {'/tmp/content':
  content => 'something else',
  validate_cmd => 'false',
}

# How about with source? YUP

file {'/tmp/source':
  source => '/tmp/content',
  validate_cmd => 'false',
  require => File['/tmp/content'],
}

# How about for a directory? ...it silently succeeds. :\

file {'/tmp/mydir':
  ensure => directory,
  validate_cmd => 'false',
}
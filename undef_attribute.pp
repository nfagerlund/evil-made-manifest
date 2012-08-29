File { content => 'default content' }

file {'/tmp/undef':
  ensure => file,
  content => undef,
  owner => 'nick',
}

file {'/tmp/undefowner':
  ensure => file,
  owner => undef,
}
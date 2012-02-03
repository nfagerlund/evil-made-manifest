# Results: You can't use ctime or mtime checksums with a content attribute... but also, the ctime and mtime checksums seem totally fucked anyway under 2.7.10 and os x 10.7. WTF?
file {'/tmp/ctime':
  ensure => file,
  # content => "stuff goest here",
  source => "puppet:///modules/git/gitconfig",
  checksum => mtime,
  mode => 0644,
}


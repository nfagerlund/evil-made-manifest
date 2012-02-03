# Proving that replace=>false also works with content, not just source.
file {'/tmp/scratcher':
  #source => '/Users/nick/Desktop/Real FAQ.txt',
  content => 'This is the init content',
  ensure => file,
  mode => 644,
  replace => false,
}


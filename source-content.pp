# As expected, can't double source/content. Interestingly, although it's obvious in hindsight, 'target' is on that list too.
file {'/tmp/doubleteam':
  ensure => file,
  source => "puppet:///modules/git/gitconfig",
  content => "And here's a conflict, sucka",
}


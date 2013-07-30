# Testing what happens when you leave the ensure attribute off a file.
# No content or source: won't create, but will manage properties if present.
# Content or source: will create.
file {'/tmp/aoeuhtns':
  mode => 0600,
  owner => nick,
  # content => 'snthueoa',
}


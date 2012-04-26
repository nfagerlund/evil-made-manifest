# The experiment: Can I override attributes without inheriting? 
# The result:
# - With resource reference: No, but I can add attributes.
# - With collection of one: Yes!

file {'/tmp/overrider':
  ensure => file,
  content => "test content",
}

File['/tmp/overrider'] {
  owner => "nick",
  mode => 0640,
  # content => "override content",
  # ensure => file,
}

File <| title == '/tmp/overrider' |> {
  content => "override content",
}


# The experiment: Can I use plusignment to append to an attribute? 
# The result: 
# - With reference: no, not unless it's in a derived class.
# - With collection: Yes!

file {'/tmp/sources.txt':
  ensure => file,
  source => 'puppet:///modules/motd/bustedfile.txt',
}

File <| title == '/tmp/sources.txt' |> {
  source +> 'puppet:///modules/motd/README.markdown',
}

# File['/tmp/sources.txt'] {
#   source +> 'puppet:///modules/motd/README.markdown',
# }

# The type reference says you can use file URIs in the source attribute. Can you?
# Yes, you can.

file {'/tmp/thing.md':
  ensure => file,
  source => 'file:///Users/nick/Documents/puppet/README.md',
}

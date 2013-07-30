# Can you use a resource's namevar or alias in a resource reference?
# AUGH.
# Yes in a relationship metaparameter
# No in a chaining statement.
# Stab me.
# And of course it doesn't work with defined. See other files starting with "alias-" to see that it doesn't work with anything else either.
file {'file1':
  path => '/tmp/file1',
  ensure => file,
  alias => ['othername', 'fourthname'],
}

file {'file2':
  path => '/tmp/file2',
  ensure => file,
  before => File['othername'],
}

# File['file2'] -> File['othername']

notice( defined(File['othername']) )


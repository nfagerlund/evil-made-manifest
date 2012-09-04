# Can you use a resource's namevar or alias in a resource reference?
# AUGH. 
# Yes in a relationship metaparameter
# No in a chaining statement.
# Stab me.
file {'file1':
  path => '/tmp/file1',
  ensure => file,
}

file {'file2':
  path => '/tmp/file2',
  ensure => file,
  before => File['/tmp/file1'],
}

#File['file2'] -> File['/tmp/file1']


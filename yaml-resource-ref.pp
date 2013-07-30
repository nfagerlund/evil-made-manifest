# Can you get resource references out of hiera? Resource references are a puppet-specific data type with an internal class of Puppet::Resource.

# As far as I can tell: NO. Hiera appears to throw away Puppet::Resource objects in the process of deserializing -- it probably isn't loading the class definition from the puppet code base. 
# Furthermore, puppet won't accept a string where it needs a resource reference. you'd need a to_resource function or something. So you can't use strings that look like resource references, either. just strings, numbers, hashes, bools, arrays. 

# dump yaml of a resource reference, and then put it into hiera 
# notice( yaml( File['/tmp/random'] ) )

file {'/tmp/random':
  ensure => file,
  content => "blah",
}

notify {'when': # defaults to before the file
  require => hiera('yaml_reference'),
}


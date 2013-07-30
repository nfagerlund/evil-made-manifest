# Can you use aliases/namevars in a resource reference append block? 
# NOPE, that'll blow up.
file {'myfile':
  path => '/tmp/aliassing',
  ensure => file,
  alias => 'something else',
}

File['/tmp/aliassing'] {
  content => "This got in here, somehow",
}


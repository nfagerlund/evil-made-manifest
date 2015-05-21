# Test using a data type as the key in a struct.

$hashone = {
  mode => write,
  path => '/etc/puppetlabs',
  links => 3,
  thing => undef,
}

$hashtwo = {
  mode => write,
  path => '/etc/puppetlabs',
  links => 3,
}

$structone = Struct[ {
  mode => Enum[read, write, update],
  path => String[1],
  links => Integer,
  thing => Optional[Integer],
}]

$structtwo = Struct[ {
  mode => Enum[read, write, update],
  path => String[1],
  links => Integer,
  NotUndef['thing'] => Optional[Integer],
}]

$structthree = Struct[ {
  mode => Enum[read, write, update],
  path => String[1],
  links => Integer,
  Enum['thing'] => Optional[Integer],
}]

notice( $hashone =~ $structone )
# true

notice( $hashone =~ $structtwo )
# true

notice( $hashtwo =~ $structone )
# true

notice( $hashtwo =~ $structtwo )
# false

notice( $hashone =~ $structthree )
# true

notice( $hashtwo =~ $structthree )
# false
# HA HA, so Enum['thing'] is the same as NotUndef['thing'], just like I suspected. This fits my intuition, but it contradicts the spec
# https://github.com/puppetlabs/puppet-specifications/blob/master/language/types_values_variables.md#struct-type
# ...which says you should only use NotUndef and Optional in the key.


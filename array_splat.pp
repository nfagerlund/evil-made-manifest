# What does array splatting actually do, outside a function call?

$myary = ['thing', 1, 5, 'other']

notify {'first':
  message => "${spew($myary)}",
}

notify {'second':
  message => "${spew(*$myary)}",
}

notify {'third':
  message => *$myary,
}

notify {'fourth':
  message => $myary,
}

# So if you just interpolate the array and the splatted array, they're indistinguishable; in a function call, it does what it says on the tin. Also, the spec says you can do that in case and selector options, as well.

$nodelist = ['wren.local', 'rook.local', 'magpie.lan', 'other.lan']
$non_matching = ['crow.local', 'albatross.local']


# This won't work:
# node $nodelist {

# this won't work either:
# node *$nodelist {
#   notify {"this node actually matched!":}
# }

# So, you can't splat into node definitions. But you can apparently splat into cases and selectors:

case $trusted['certname'] {
  default:        { notify {"Matched the default for some reason??":} }
  *$non_matching: { notify {"Matched the non-matching list for some reason??":} }
  *$nodelist:     { notify {"matched as expected":} }
}

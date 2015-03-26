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

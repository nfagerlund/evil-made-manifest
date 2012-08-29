$myvar = "top scope"

if $myvar {
  #$myvar = "if scope"
  $othervar = "if scope too"
  notice ("myvar is $myvar")
}

notice ("and outside the conditional, myvar is $myvar and othervar is $othervar")



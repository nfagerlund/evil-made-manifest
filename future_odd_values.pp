# What's the value of a variable assignment expression?
# it's the value that was assigned to the variable.
notice(spew( $mystring = "some value" ))
notice(spew( ($myvariable = 8) + 12 ))
notice(spew( $myvariable ))

# Does a class definition have a value?
# NO, and it can't be used where a value is expected.

# $myclass = class myclass ($myparam) {
#   notify {"I'm inside the class.":}
# }
#
# notice(spew( $myclass ))

# Value of a resource default statement?
# a Puppet::Resource; that is, a resource type. (Notify[] in this case -- it has a resource type name, is a subtype of Resource, but has no title.)
$mydefault = Notify {
  message => "Default message dude.",
}

notice(spew( $mydefault ))

# Value of a resource reference attribute amendment statement?
# a resource reference, with title, to the affected resource.
notify {"I'm a notify.":}
$myamend = Notify["I'm a notify."] {
  message => "And my message is amended.",
}
notice(spew( $myamend ))

# Value of a resource collector?
# NOPE, it doesn't produce a value and can't be used in arbitrary value contexts; just the special ones that are listed as accepting them. Guess they're still weird critters.
# $mycollector = Notify <| |>
# notice(spew( $mycollector ))


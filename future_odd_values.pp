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

# Value of a chaining statement:

$mychain = (notify {"I come second.":} <- Notify["I'm a notify."])
notice(spew( $mychain ))
# Well, in that case it's a single-element array whose only member is the resource reference that came LAST in the statement, regardless of which direction the arrow was pointing. How about some weirder ones?

$myweirdchain = (file {"/tmp/thing": ensure => file,} -> Notify <| |>)
notice( $myweirdchain )
# notice(spew( $myweirdchain ))
# HAHAHAHAHAHAHA HOLY SHITTTTT, IT'S THE ENTIRE FUCKIN UNIVERSE!!! Well, so it
# assigned the value of the resource collector to a variable. I guess that's the
# way to get around the rules and do that. It's a
# Puppet::Pops::Evaluator::Collectors::CatalogCollector:0x007fe5f48d0fb8 And
# since I guess it has references to the entire catalog state and possibly the
# rest of the program state, my spew() function dumped it out and it took like 2
# minutes to run, barfing reams to the terminal. I'm seeing facts in here,
# modules, environments, bindings, loaders, modules, wow. But it continued without complaint!!!

# Okay, how about a multi-resource reference.

$mymultichain = (notify {"the alpha":} -> Notify["I come second.", "I'm a notify."])
notice(spew( $mymultichain ))
# That's an array of resource references equivalent to the multi-reference. That's fine and expected.

# How about a long chain?

$mylongchain = (notify {"long one":} -> Notify["I'm a notify."] -> notify {"long two":})
notice(spew( $mylongchain ))
# single element array containing the value of the last operand in the whole chain, in this case Notify["long two"].


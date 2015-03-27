# This behavior differs in future parser vs. 3.x: future disallows starting with digits for user-assigned variables. Only regex capture vars can start with numbers!

# $0variable = "hi i'm zero"

# notify {"found $0variable":}

$capVariable = "hi i'm cap"

notify {"found $capVariable":}

define paramvartest ($capParam) {
  notify {"found $capParam":}
}

paramvartest {'thing':
  capParam => "hi I'm capparam",
# This won't work tho:
#  capparam => "hi I'm capparam",
}

# Not allowed: will cause syntax error at 27.
# define paramvartest_two ($_underparam) {
#   notify {"found $_underparam":}
# }
#
# paramvartest_two {'thung':
#   _underparam => "hi I'm underparam",
# }

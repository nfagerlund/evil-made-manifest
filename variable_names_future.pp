# This behavior differs in future parser vs. 3.x: future disallows starting with digits for user-assigned variables. Only regex capture vars can start with numbers!

$0variable = "hi i'm zero"

notify {"found $0variable":}

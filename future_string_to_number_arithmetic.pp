# Are the arithmetic operators really an exception to the rule about not auto-converting strings to numbers?

notice(spew( "12" + "11" ))
# Notice: Scope(Class[main]): [23]
# [Fixnum]
# wow. yes.

notice(spew( "077" + "11" )) # 74, so it does radix conversion too.

notice(spew( -"077" )) # -63. unary - works fine too. but!!!!
notice(spew( "-077" ))
# Notice: Scope(Class[main]): ["-077"]
# [String]
# ... if the operator is inside the quotes, it cancels out.

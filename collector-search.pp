# Testing whether the == in a collector can work like a reverse 'in' statement for attributes with array values.
# IT CAN. whaddaya know. 
# also testing: can you transpose the operands like in a normal == statement, or not? 
# YOU CAN'T. clearly == != ==.
# Can you use an array as the right operand of ==?
# Yes, but it's wack. ['three', 'two'] will only match the three-tag one, ['two', 'three'] will match the two and the three. I am calling that bullshit enough to be undefined. And hashes don't create a syntax error, which is exciting, but I can't figure out what that would do. 
# Booleans and resource references work as the right operand, as expected apparently. 
# Undef apparently doesn't do anything. OR NO WAIT, it does, but only if you explicitly set an attribute to undef. 
# Uh whoa, != always matches if the value of the attribute is an array. 
# Collectors in functions is a no-go. 

# How about variables? Can you use a variable to do collection? 
# YES, you can. 

@notify {'one tag':
  tag => 'one',
}
@notify {'two tags':
  tag => ['one', 'two'],
  #before => Notify['three tags']
} 
@notify {'three tags':
  tag => ['one', 'two', 'three'],
  noop => undef,
} 

# Notify <| tag == {'two' => 'three'} |>

# Notify <| before == Notify['three tags'] |>
#Notify <| noop == undef |>

# defined (Notify <| tag != ['one', 'two'] |>)

$allowed = 'two'
Notify <| tag == $allowed |>
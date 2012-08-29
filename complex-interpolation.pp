# Testing expression interpolation

# Can you do arithmetic expressions in a ${}? YES
$x = 5
$y = 3
notice("Five by three is ${$x * $y} so yeah")

# Can you do regex match expressions? YES
$mystring = "Nothing in particular"
notice("But it was ${$mystring =~ /thing/}")

# Can you use an in statement? YES
# Can you use quotes inside a ${}? YES
# Even if they're the same type of quote you used for the surrounding string? YES
notice("This time with an in statement: Is there a thing in nothing? ${"thing" in $mystring} so yeah")

# Can you use an rvalue function inside a ${}? NO
# notice("There's a function in here: ${fqdn_rand 30} so yeah")

# How about a function in an expression? Actually, let's try it outside interpolation first:

$result = fqdn_rand(30) + 90
notice($result)

# Now in an interpolated expression:
# notice("There's a function operand in here: ${ fqdn_rand(30) + '90' } so yeah") # NO, that doesn't work.

# Compound expressions: Yay or nay? YES
notice("five x three plus 10 is ${$x * ($y + '10')} so yeah")

# Can you duplicate the sigil inside a ${} with just a variable? YES
# With arbitrary space in there? YES
notice("Variable with doubled sigil: ${ $x} so yeah")

# How does it resolve variable names if you leave out the sigil? Can you fuck with the spacing? YES
notice("Singular sigil, but with wacky spacing: ${  x} so yeah")

# Can you just put a literal in there? YES
notice("Yo dawg, I heard you like ${"strings, so I put a string in your"} string")
# How about bareword strings? NO, they become undef vars. 
notice("Yo dawg, I heard you like ${ barewords } so yeah")

# How about expressions with no variables (although I already know this one)? OH SURPRISE: that's a YES BUT only if the numbers are QUOTED, since I guess they become undef variables if they aren't.
notice("Twenty by eighty is ${ '20' * '80' } so yeah")

# Let's test that last one more throughly: 
$20 = 21
$80 = 81
$20x = 22
# notice("Twenty by eighty probably isn't: ${20 * 80}") # This one blows up, surprisingly! 
notice("Twenty by eighty probably isn't: ${20}") # This one has a hole.
notice($20) # Nothing. 
notice($20x) # Ok, that works?
# Oh I see what's going on here. Variables that consist only of numbers are reserved for regex captures and assigning to them is a noop. It's not just $0 - $9, it's all the way up through $20 etc. Detour: is there a limit on how far that goes? 
$2000 = "Anything?"
notice($2000)
# Apparently not! $\d+ is always reserved the way the regex capture vars are. Can we actually use more than 9 captures?
if ('abcdefghijklmnopqrstuvwxyz' =~ /^(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)(\w)/) {
  notice("So at least that regex works")
  notice("24th letter is $24")
}
# YAY, that actually works! OK, cool. 

# Okay, I think there's one more thing I haven't explicitly tested, which is whether barewords always resolve to variables in an expression:
$substr = 'particular'
notice("Is it anything in particular? ${substr in mystring} so yeah")
notice("Is it anything in particular? ${$substr in $mystring} so yeah")
# ARGH, these resolve completely opposite to each other. What is it doing? 

$n = 31
$m = 15
# notice("Add 'em ${n + m}") # This one blows up w/ not a number
notice("self? ${n == '31'}")
# That one's true, so WTF??
$one = "particular"
$another = "particular"
notice("identity? ${one == another}")
# ARRRGGH
notice("literal identity? ${one == 'particular'}")
# ALSO ARGH
# I give up, cannot tell what is going on here. 


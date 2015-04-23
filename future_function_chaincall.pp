# Can I use a lambda without a function?
# |$a| { notify {$a:} }
# Yup, it just won't do anything.
# ^H^H^H^H^H^H^H NOOOOOOOOOOOOOOOOOOO!!! It turns out that, in this line's previous position in the file, the lambda was just attaching itself to the chained call to the `notice` function in the line above! Where it did nothing. If I move it above a function call that it can attach itself to, it results in:
# Error: Could not parse for environment production: Syntax error at '|' at /Users/nick/Documents/manifests/future_function_chaincall.pp:2:1 on node magpie.lan


# how about assigning one to a variable?

# $mylambda = (|$a| { notify {$a:} })
# NOPE
# Error: Could not parse for environment production: Syntax error at '|' at /Users/nick/Documents/manifests/future_function_chaincall.pp:39:14 on node magpie.lan

# So they aren't value-producing expressions. ...I guess.

# Chain include?

class myclass { notify {"hi":} }

# myclass.include # works
# [myclass].include # works
# Yeah dude totally!!!

# extra arguments?

class otherclass { notify {"sup":} }

# myclass.include(otherclass) # works
# Yeah that totally works as expected

# trailing comma?
# include( myclass, otherclass, ) # works
# sure!
# myclass.include(otherclass, ) # FAILS!
# NOPE. So it's allowed in prefix calls but not chain calls.


# lambda to prefix call?

$myeach = each( [a, b, c, d] ) |String $thing| { notify {$thing: message => "it's a $thing",} }

notice( "Myeach is $myeach") # Notice: Scope(Class[main]): Myeach is [a, b, c, d]
# Value of each has nothing to do with the lambda; it returns its input argument.

# Yup, simple.

# Spaces before parens?
notice ( str2bool ("true") )
# ...I guess that still works.

# space before/after dot?

"true" . str2bool . notice
# ...works fine, and so does:

0 . num2bool . notice
# (I had a brief module failure that broke that.)

# sidebar: are qualified names bare words?

notice( myclass::ntp )
notice( num2bool )
# sure are.


# Lambdas with no parameters?
with(a) || { notice("called this dumb lambda again") }
# Sure! You need the pipes, though, otherwise it's a syntax error.

# lambdas with trailing commas?
each( [a, b, c, d] ) |String $thing, | { notice( "again" ) }
# sure, works fine.

# How's that final splat param work?
with( a, b, c, d ) |String $thing, String *$splats | { notice( $thing ); notice(spew($splats)) }
# Notice: Scope(Class[main]): a
# Notice: Scope(Class[main]): [["b", "c", "d"]]
# [Array]

# cool.

# although it's always an array, the data type restriction will be enforced on each element.
# with( a, b, c, d ) |String $thing, Integer *$splats | { notice( $thing ); notice(spew($splats)) }
# Error: Evaluation Error: Error while evaluating a Function Call, lambda called with mis-matched arguments
# expected:
#   lambda(String thing, Integer splats{0,}) - arg count {1,}
# actual:
#   lambda(String, String, String, String) - arg count {4} at /Users/nick/Documents/manifests/future_function_chaincall.pp:79:1 on node magpie.lan

# Splats is an empty array if add'l arguments aren't supplied.
with( a ) |String $thing, String *$splats | { notice( $thing ); notice(spew($splats)) }
# Notice: Scope(Class[main]): a
# Notice: Scope(Class[main]): [[]]
# [Array]

# You can have a default for splats that matches the defined data type, and it'll get wrapped in an array automatically...
with( a ) |String $thing = "thing default", String *$splats = "splats default" | { notice( $thing ); notice(spew($splats)) }
# Notice: Scope(Class[main]): a
# Notice: Scope(Class[main]): [["splats default"]]
# [Array]

# ...or you can specify an array with one or more matching values, and it'll use that directly. Note also that you can have air between the splat and the variable name.
with( a ) |String $thing = "thing default", String * $splats = ["splats default one", "default two"] | { notice( $thing ); notice(spew($splats)) }
# Notice: Scope(Class[main]): a
# Notice: Scope(Class[main]): [["splats default one", "default two"]]
# [Array]

# ...but you can't do unmatching values:
# with( a ) |String $thing = "thing default", String *$splats = {a => "splats default one"} | { notice( $thing ); notice(spew($splats)) }
# Error: Evaluation Error: Error while evaluating a Function Call, lambda called with mis-matched arguments
# expected:
#   lambda(String thing?, String splats{0,}) - arg count {0,}
# actual:
#   lambda(String, Struct[{'a'=>String}]) - arg count {2} at /Users/nick/Documents/manifests/future_function_chaincall.pp:106:1 on node magpie.lan


# How about putting a required param after an optional one?

# with( a,b ) |String $thing = "default", String $other | { notice( $thing ); notice( $other ) }

# That's an error:
# Error: Evaluation Error: Parameter $other is required but appears after optional parameters at /Users/nick/Documents/manifests/future_function_chaincall.pp:113:48 on node magpie.lan


# Build-your-own-assoc?
$mangled_hash = ['key1', 'first value', 'key2', 'second value', 'key3', 'third value']

$my_hash = $mangled_hash.slice(2).reduce( {} ) |Hash $memo, Array $pair| {
  $memo + $pair
}

notice(spew($my_hash))
# Yup, results in {"key1"=>"first value", "key2"=>"second value", "key3"=>"third value"}
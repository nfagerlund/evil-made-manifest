notice( spew( functionbucket::square_me(200) ))
# Notice: Scope(Class[main]): [40000]
# [Fixnum]

#notice( spew( functionbucket::square_me('NaN') ))
# Error: Evaluation Error: Error while evaluating a Function Call, 'square_me' parameter 'number' expects a Numeric value, got String at /Users/nick/Documents/manifests/functions_in_puppet.pp:7:15 on node magpie.lan

notice( spew( functionbucket::square_me(200, 300, 400) ))
# Notice: Scope(Class[main]): [[40000, 90000, 160000]]
# [Array]

# notice( spew( functionbucket::square_me(200, 300, 'NaN', 500) ))
# Error: Evaluation Error: Error while evaluating a Function Call, 'functionbucket::square_me' parameter 'numbers' expects a Numeric value, got String at /Users/nick/Documents/manifests/functions_in_puppet_in_module.pp:12:15 on node magpie.lan

# Cool.

# include at_tester
# notice( functionbucket::default_value() )

class hey {
  $fqdn = "overridden"
  notice( functionbucket::default_value() )
  # Notice: Scope(Class[Hey]): wren
}
include hey

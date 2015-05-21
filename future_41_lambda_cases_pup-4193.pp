# This actually got ripped out for 4.1, but it was working for a while in pre-release builds.

notice case [2,1] {
 |$x, $y| { $x  == $y } : { 'equal' }
 |$x, $y| { $x  <  $y } : { 'ascending' }
 |$x, $y| { $x  >  $y } : { 'descending' }
}

# This does not affect selectors.
# notice [2,1] ? {
#  |$x, $y| { $x  == $y } => 'equal',
#  |$x, $y| { $x  <  $y } => 'ascending',
#  |$x, $y| { $x  >  $y } => 'descending',
# }
# Error: Could not parse for environment production: Syntax error at '|' at /Users/nick/Documents/manifests/future_41_lambda_cases_pup-4193.pp:8:2 on node magpie.lan


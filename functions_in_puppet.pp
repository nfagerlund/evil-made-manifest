function none::square_me(Numeric $number, Numeric *$numbers) {
  if $numbers != [] {
    $all = [$number, $numbers].flatten
    $all.map |$x| {$x * $x}
  }
  else {
    $number * $number
  }
}

notice( spew( none::square_me(200) ))
# Notice: Scope(Class[main]): [40000]
# [Fixnum]

#notice( spew( square_me('NaN') ))
# Error: Evaluation Error: Error while evaluating a Function Call, 'square_me' parameter 'number' expects a Numeric value, got String at /Users/nick/Documents/manifests/functions_in_puppet.pp:7:15 on node magpie.lan

notice( spew( none::square_me(200, 300, 400) ))
# Notice: Scope(Class[main]): [[40000, 90000, 160000]]
# [Array]

# Cool.

function make_resource(String $thing) {
  file {"/tmp/$thing":
    ensure => file,
    content => "made by function thingy thing.",
  }
}

notice( spew( make_resource("hey_hey_hey_hi") ))

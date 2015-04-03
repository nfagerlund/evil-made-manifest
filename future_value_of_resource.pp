# Value of a resource expression is an array of resource references, even if it's a single-element array. Order of references is in the order of resources listed in the expression.

$mapped_refs = [a, b, c].map |$x| { notify { $x: } }
notice(spew(
  $mapped_refs
))

$array_title = (
  notify { [ first, second, third, fourth ]: }
)
notice(spew(
  $array_title
))

$multi_declare = (
  notify {
    default:
      message => "defaulted",
    ;
    fifth:;
    sixth:
      message => "overridden",
    ;
    seventh:;
    eighth:;
  }
)
notice(spew(
  $multi_declare
))

# Precedence is extremely low, lower than the = asignment operator, so sometimes you need to use parens.

# How's chaining work with an array of arrays of resource references???

# $multi_declare -> $mapped_refs -> $array_title

# Wow, it works fine. ...can we keep nesting?????????

$super_nested_array = [
  [
    [Notify[a]], [
      [Notify[b]]
    ],
  ],
  [
    [[Notify[c]]], []
  ]
]

$multi_declare -> $super_nested_array -> $array_title

# Yeah, no, fucked-up as it looks, that works just fine. It can even include empty arrays. So that's gonna take a revision of the relationships page.

# On the other hand, can't do this:

# $super_nested_array = [
#   [
#     [Notify[a]], [
#       [Notify[b]]
#     ],
#   ],
#   [
#     [[Notify[c]]], "arbitrary string", 1234, {}
#   ]
# ]

# Error: Evaluation Error: Error while evaluating a '->' expression, The expression <arbitrary string> is not a valid type specification.

# Hey, can reference attribute blocks take nested arrays?
  # NO THEY CAN'T. Or arrays at all. Or arrays in variables.

# [Notify[first], Notify[second]] {
#   message => "From a reference attribute block",
# }

# How about, can I store a multi-resource reference in a variable and use that?

$multi_reference = Notify[first, second, third]
#
# $multi_reference {
#   message => "From a reference attribute block",
# }

# Nope. I think it's because a multi-reference has a value of an array of resource references:

notice(spew($multi_reference))

# Yes. OK, how about a single reference?

$one_reference = Notify[first]

# $multi_reference {
#   message => "From a reference attribute block",
# }

# Nope, that's vetoed too.

# Can I splat in hash values into a reference attribute block?

$myattrs = {"message" => "from a reference attribute block"}

# Notify[first] { *=> $myattrs }
notify {'extra': *=> $myattrs }
# Notify <| title == 'first' |> { *=> $myattrs }

# Nope, absolutely not. Haha WHOA that last one: Error: Could not parse for environment production: In Puppet::Pops::Model::CollectExpression : Can not use a Puppet::Pops::Model::AttributesOperation where a Puppet::Pops::Model::AttributeOperation is expected on node magpie.lan
# Spot the plural!


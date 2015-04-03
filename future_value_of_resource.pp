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
    [[Notify[c]]]
  ]
]

$multi_declare -> $super_nested_array -> $array_title

# Yeah, no, fucked-up as it looks, that works just fine. So that's gonna take a revision of the relationships page.

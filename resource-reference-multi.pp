# What I learned: multi-references can be used anywhere an array of references can be used, but not vice-versa. 
# You can use a multi-reference with an attribute block, but not an array.
# Additionally, collectors don't yield arrays of resource references; they're a special syntax. Can't use them as the value of an attribute, although you can order them with chain arrows. 
# an array of resource refs can't be the object of a chain arrow! But a multi-ref can. 
# Multi-refs can be included in arrays of references.
# You can use an array (or variable containing an array) instead of a comma-separated list.
notify {'third':
  tag => 'feh',
}

notify {'secondish':
  before => Notify[ [ 'four', 'firstlyish', 'third'] ], 
  # before => Notify <| tag == feh |>,
}
notify {'firstlyish':
  tag => 'feh',
}
notify {'four':} notify {'five':}

Notify['firstlyish', 'secondish', 'third'] {
  message => "HAHAHAHAHA",
}

Notify <| tag == feh |> {
  message => 'overridden!',
}

# Notify['secondish'] -> [Notify['firstlyish'], Notify['third']]

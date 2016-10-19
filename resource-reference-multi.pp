# What I learned: multi-references can be used anywhere an array of references can be used, but not vice-versa.
# You can use a multi-reference with an attribute block, but not an array.
  # This remains true in 4.x, and actually kind of makes sense, since there's no guarantee that an array of references are all the same resource type. And it now gives a helpful error.
# Additionally, collectors don't yield arrays of resource references; they're a special syntax. Can't use them as the value of an attribute, although you can order them with chain arrows.
# an array of resource refs can't be the object of a chain arrow! But a multi-ref can.
  # THIS HAS CHANGED, and in 4.x it's now legal to chain arrays.
# Multi-refs can be included in arrays of references.
# You can use an array (or variable containing an array) instead of a comma-separated list.
  # I can't remember what I meant by this.
notify {'third':
  tag => 'feh',
}

notify {'secondish':
#   before => Notify[ [ 'four', 'firstlyish', 'third'] ],
  # before => Notify <| tag == feh |>,
}
notify {'firstlyish':
  tag => 'feh',
}
notify {'four':} notify {'five':}

Notify['firstlyish', 'secondish', 'third'] {
  message => "HAHAHAHAHA",
}

# [ Notify['firstlyish'], Notify['secondish'], Notify['third'] ] {
#   message => "HAHAHAHAHA",
# }
# Error: Could not parse for environment production: Expression is not valid as a resource, resource-default, or resource-override at /Users/nick/Documents/manifests/resource-reference-multi.pp:24:1 on node magpie.lan

Notify <| tag == feh |> {
  message => 'overridden!',
}

Notify['secondish'] -> [Notify['firstlyish'], Notify['third']]

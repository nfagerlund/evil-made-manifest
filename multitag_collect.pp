# Proof that collecting works with tags even if there are multiple tags on a resource. 
@notify {'This should fire':
    tag => ['foo', 'bar', 'bootstrap'],
}

Notify <| tag == 'foo' |>


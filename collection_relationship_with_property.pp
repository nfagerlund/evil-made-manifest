# This tests whether you can create relationships by chaining collections that query based on provider. The answer is that you can, but ONLY if you explicitly specify the provider in the manifest -- if it would have to be queried from the system, the parser can't see it. Comment out the provider => yum line to see what I mean. 
notify {'something':
  message => "Hopefully this goes after, but whatevs",
}

package {'ntp':
  noop => true,
  ensure => present,
  provider => yum,
}

Notify <| |> -> Package <| provider == yum |>


Just a demonstration of some many-to-many relationships.

notify {'first_group_one':
  tag => 'first',
}
->
notify {'first_group_two':
  tag => 'first',
}
notify {'second_group_one':
  tag => 'second',
}

Notify <| tag == 'first' |> -> Notify <| tag == 'second' |>

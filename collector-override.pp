# We already know that collectors can override resource attributes. 
# Can they do plusignment? 
# Yes, yes they can! Proving it here by making a cycle, but check the graphs too. 
notify {'irrelevant':}
notify {'center':
  before => Notify['irrelevant'],
}
notify {'first':
  before => Notify['center'],
}

Notify <| title == center |> {
  before +> Notify['first']
}


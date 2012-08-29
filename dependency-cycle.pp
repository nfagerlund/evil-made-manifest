notify {'first':
  require => Notify['second'],
}
notify {'second':
  require => Notify['first'],
}
notify {'unrelated':}


class explicitly {
  # $variable = 'I live in class explicitly.'
  
  notify {'mahnote':
    # message => $explicitly::variable,
    message => $parent::variable,
  }
}

class parent {
  # $variable = 'I live in class parent'
  include explicitly
}

class grandparent {
  $variable = 'I live in class grandparent'
  include parent
}
include grandparent

# WOW. Okay, so explicit namespacing only defines where lookup STARTS; it's still governed by normal rules of scope lookup. 
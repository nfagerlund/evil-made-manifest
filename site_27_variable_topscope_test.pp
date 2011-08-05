node default {
  $::myvar = "Hi There"
  include myclass
}

class myclass {
  $myvar = "You shouldn't see this"
  notify { test: message => $::myvar }
}

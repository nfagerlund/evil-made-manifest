# How's lambda scope work?
# Can't access $classvar, so it looks like it's lexical scope.... well, actually it's probably dynamic scope, but it ends up being the same thing because lambdas are always literal and can't be stored in variables... right?

$topvar = "hi, top"

define testdefine ($value) {

  $definevar = "thing"

  ["one", "two"].each |$lambdaparam| {
    notify {"in define $title, value $value, definevar $definevar, classvar $classvar, topvar $topvar, lambdaparam $lambdaparam.":}
  }

}

class testclass {
  $classvar = "hi in the class."

  testdefine {'first':
    value => "first value",
  }

  testdefine {'second':
    value => "second value",
  }
}

include testclass

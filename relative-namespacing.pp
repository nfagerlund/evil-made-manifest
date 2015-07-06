class foo::thing {
  notify {"from foo::thing":}
}

class thing {
  notify {"from ::thing":}
}

class foo {
  class {'thing':}
}

include foo


#-------------------------

class bar::other {
  class {'other':}
}

class other {
  notify {"from ::other":}
}

include bar::other


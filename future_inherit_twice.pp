# Can you inherit the same class twice, or does inheritance block further inheritance?

class base {
  notify {"hey":}
}

class once inherits base {
  notify {"hoooooo":}
}

class twice inherits base {
  notify {"say ho, ho":}
}

include once
include twice

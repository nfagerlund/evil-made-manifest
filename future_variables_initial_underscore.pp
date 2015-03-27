# Testing https://github.com/puppetlabs/puppet-specifications/blob/master/language/deprecations.md#variables-with-initial-underscore

$_mytopscopevar = "hi, i'm at top scope."

class thing {
  $_mylocalvar = "hi, I'm in class thing"
  notify {"from class thing, local: ${_mylocalvar}.":}
  notify {"from class thing, falling back through scopes: ${_mytopscopevar}":}
  notify {"from class thing, explicit top scope: ${::_mytopscopevar}":}

}

include thing

notify {"from top scope, local: ${_mytopscopevar}":}
notify {"from top scope, qualified: ${thing::_mylocalvar}":}

# So, this all still works... but we'll want to check back at some point. It's marked as deprecated to do non-local access to a $_var.
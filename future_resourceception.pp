# Okay, so but like listen,

notify {"mynotify":
  message => (file {"/tmp/whatnow": ensure => file, content => "NO WAY",}),
}

# The parens are mandatory because of precedence but wow, yes, that totally works.
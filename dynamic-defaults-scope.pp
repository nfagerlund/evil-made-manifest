# Are dynamic scoped resource defaults deprecated in 3.x?
# NOPE, they don't put out any kind of warning. 

class myclass {
  File {
    content => "Boo, it worked",
  }
  include myotherclass
}

class myotherclass {
  file {'/tmp/shouldbeempty':
    ensure => file,
  }
}

include myclass



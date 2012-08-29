#  testing whether you can set name => blah in a class like you can in a define. Woo, you totally can. 
class myclass {
  notice($name)
}

class {'myclass':
  name => "something else",
}


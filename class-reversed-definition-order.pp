# test whether the availability of a class for declaration is parse-order dependent 
# Answer: As expected, it's not. You can define after you declare.
include myclass

class myclass {
  notify {'somtehnig, yeah!':}
}


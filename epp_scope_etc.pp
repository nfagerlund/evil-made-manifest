$y = "top scope"

class epp_thing {

  $x ='local variable'
  notify { "epp notify":
    message => inline_epp(@(END:epp), {x => "from parameter"}),
        <%- |$x| -%>

    Hello <%= $x -%>          
    world!
    Also, Y is at <%= $y %>.
    | END
  }
}

node default {
  $y = "node scope"
  include epp_thing
}

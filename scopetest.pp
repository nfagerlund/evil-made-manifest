# manifests/nodes
$nodetype = "base"

node "base" {
    include postfix
    ...snip...

}

node "www01", "www02", ... , "www10" inherits "base" {
     $nodetype = "wwwnode"
     include postfix::custom

}

# modules/postfix/manifests/init.pp
class postfix {
     package {"postfix": ensure => installed}
     file {"/etc/postfix/main.cf":
          content => template("puppet:///files/main.cf.erb")
     }

}

# modules/postfix/manifests/custom.pp
class postfix::custom inherits postfix {
     File ["/etc/postfix/main.cf"] {
          content => undef,
          source => ["puppet:///files/$hostname/main.cf",
                           "puppet:///files/$nodetype/main.cf" ]
     }

} 

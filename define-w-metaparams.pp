# This shows that:
# * metaparams like noop can be referenced as variables from inside a defined type.
# * Noop DOES act on every resource contained in a defined type, without having to do noop => $noop every time.
# * Noop does in fact keep notifies from properly firing. 
# * Likewise with things like before or require. They get propagated to every contained resource. 
# Also, you can do a per-resource override of single-value metaparameters like noop, but multi-value ones will merge the value from the container and the local value.
define thingy ($message) {
    notify {"$title":
      message => "Message received: $message. No-op is ${noop}!",
      require => Notify['way last last dammit last'],
    }
    file {"${title}-turd":
      ensure => file,
      path => "/tmp/${title}-noop",
      content => "If noop is true, this shouldn't be here. Noop is ${noop}.",
   }
}

thingy {'thing':
  message => 'some  message',
  noop => true,
  require => Notify['firstly'],
}

notify {"firstly":}
notify {"way last last dammit last":}

#thingy {'second-thing':
#  message => "This should go after the first notify",
#  require => Notify['firstly'],
#}


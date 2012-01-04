# This shows that:
# * metaparams like noop can be referenced as variables from inside a defined type.
# * Noop DOES act on every resource contained in a defined type, without having to do noop => $noop every time.
# * Noop does in fact keep notifies from properly firing. 
define thingy ($message) {
    notify {"$title":
      message => "Message received: $message. No-op is ${noop}!",
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
}

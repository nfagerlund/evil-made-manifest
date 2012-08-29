# Testing whether require works the way I thought it did. 
# Answer: Yes, it makes a dependency w/ the surrounding container. also you have to make a whole shitload of notifies if you want to reliably have them sandwich another one.
define thingy {
  notify {"aaaaa aaa The notify in $title aaaaaaaaa":}
  require thinger
}

class thinger {
  notify {"the notify in class thinger":}
  notify {'another notify':}
  notify {'Yet another notify!':}
}

thingy {'my thing':}

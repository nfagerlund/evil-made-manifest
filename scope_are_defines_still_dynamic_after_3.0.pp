# Testing whether DEFINES also get dynamic scope removed. They do!
define thingy {
  notify {"Name is $name and variable is $some_var":}
}

$some_var = "Top scope!"

class miss_thing {
  $some_var = "class scope!"
  thingy {'tester':}
}
include miss_thing


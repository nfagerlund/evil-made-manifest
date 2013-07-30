# Try not putting dollar signs in front of params in the param list.
# This gives a warning in 2.7 and a failure in 3.x.

define somedefine (myparam) {
  notify {$myparam:}
}


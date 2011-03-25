# From IRC. 

stage { pre: before       => Stage["main"]}
stage { post: require     => Stage["main"]}

class skel #inherits skel::default # The inheritance relationship will result in a:
# Duplicate definition: Class[Skel::Default] is already defined; cannot redefine at /Users/nick/Documents/manifests/stages-test.pp:5 on node magpie.puppetlabs.lan
# ...error once class skel is actually declared. WHOOPS.

{
  class { "skel::default": stage  => pre } # Need quotes around class name
}
    
class skel::default {
  notify { "Test notification, woo.": }
}

include skel

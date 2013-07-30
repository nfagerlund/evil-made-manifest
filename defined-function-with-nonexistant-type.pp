# Can you use the if defined(type) { resource of that type } pattern?

# Outside a class? YES
# When inside a class with no name relationship to that type? YES.
# When inside a class with a final namespace segment that matches the name of that type?
  # When a defined type and you don't add :: to the front of the name inside the defined function? NO, it blows up if the type doesn't exist.
  # When a defined type and you do add :: to the front: YES.
  # When a native type, and without :: -- well, same, if the type doesn't exist.
  # When a native type, and with :: -- NOPE! Won't detect the type if it exists. Ugh.

# So basically: defined() checks class names in addition to type names, and relative namespacing continues to be evil. If you have a class whose name's final namespace segment matches the name of a resource type, you can't, in general, test for the existence of that type inside that class (whoo). If it's a defined type, you can force it to work by adding an explicit :: in front of the type's name, but that will always give a false negative with native types. In short, ntp::firewall can't conditionally create firewall {'etc':} resources using defined -- you'd have to rename the class to ntp::firewall_rules or something.



define firewall ($aoeu = 'x', $htns = 't') {
  notice("Yup, that's a firewall")
}

class ntp::firewall {

  if defined(::file) {
    firewall {'saonetuh':
      aoeu => 'bbb',
      htns => 'tttt',
    }
  }
  else {
    notice ("nothin'")
  }

}

include ntp::firewall

# Notice that this DOES blow up if you uncomment the resource here:
# filea {'aoeu':
#   aoeu => ",.u",
# }


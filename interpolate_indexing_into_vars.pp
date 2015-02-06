$mystructure = {
  'first' => 1,
  'second' => ["a", "b", "c"],
  'third' => "hey",
}

# Does interpolating indexing into it work without a leading dollar sign?

notify {'hey':
  message => "Value is ${mystructure[second][1]}", # should be b
}

# Yes. Note that the hash key strings can be quoted or not.

# How about with a leading dollar sign?

notify {'hi':
  message => "Value is ${$mystructure['second'][1]}", # should be b
}

# Yes.

# How about alternate radix for array indices, and interpolation of hash keys? (Spoiler: yes)

$thing = "second"

notify {'whoa':
  message => "Value is ${mystructure[$thing][0x01]}", # should be b
}

# Arithmatic in array indices? Yup, totally okay.

notify {'ugh':
  message => "Value is ${mystructure[$thing][6/3]}", # should be c
}


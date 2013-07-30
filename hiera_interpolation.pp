# Can hiera read keys from hashes and stuff when it rec's non-string vars in its scope? 
# NOPE, debug output says it found it, but then it just fuckin hangs. 
# Tried w/ several forms of quoting and not quoting. 
# 13 hashmember: %{"myhash['firstkey']"}
#  14 arraymember: %{myarray[1]}

# What happens when you interpolate something other than a string? 

# Resource reference: 
# Error: can't convert Puppet::Resource into String at /Users/nick/Documents/manifests/hiera_interpolation.pp:15 on node magpie.lan
# Wrapped exception:
# can't convert Puppet::Resource into String
# Error: can't convert Puppet::Resource into String at /Users/nick/Documents/manifests/hiera_interpolation.pp:15 on node magpie.lan

# Number: works fine. 

# Bool: 
# Error: can't convert true into String at /Users/nick/Documents/manifests/hiera_interpolation.pp:26 on node magpie.lan
# Wrapped exception:
# can't convert true into String
# Error: can't convert true into String at /Users/nick/Documents/manifests/hiera_interpolation.pp:26 on node magpie.lan

# Undef: 
# Error: can't convert Symbol into String at /Users/nick/Documents/manifests/hiera_interpolation.pp:31 on node magpie.lan
# Wrapped exception:
# can't convert Symbol into String
# Error: can't convert Symbol into String at /Users/nick/Documents/manifests/hiera_interpolation.pp:31 on node magpie.lan

# Complete array or hash:
# Totally predictable blow-up. 

# Okay, the converse -- what happens when Hiera returns something odd?
# Bools
# Handled just fine

# Numbers
# Handled just fine. 

# Arrays
# come to think of it I've already tested all that.

# Symbols
# Fail totally.



# $myhash = { firstkey => 'firstvalue', secondkey => 'secondvalue' }
# $myarray = ['first', 'second']
# notice( hiera( arraymember ) )
# notice( $myhash['secondkey'] )

$arbitrary_type = [one, two]
notice( spew( hiera( odd_thing ) ) )

notice( hiera( odd_thing ) )


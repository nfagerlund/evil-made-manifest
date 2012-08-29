# Can you append to things other than variables? 
# FIRST: Type of thing appended always has to match. Can't append a string to an array, have to append a single-item array to an array.
# SECOND: Yes. Arrays work as expected, once you iron out the type match thing. Hashes work as expected. Strings do normal concatenation. 
# THIRD: Bools don't work, that would be stupid. resource refs don't work either. 
$myvar = Notify['mynotify']

class myclass {
  $myvar += Notify['something else']
  notice( spew($myvar) )
}

include myclass


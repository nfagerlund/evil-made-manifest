$myary = [0, 1, true, 'testing', 'true', false, 'false', 'hi', 'bye']

if $myary[5] { notice('false is true') }
notice (spew( $myary[5] ))
$mything = 'testing'

if $mything in $myary { notice("bools don't poison everything at least") }
# if true in $myary {notice("not really sure what I'm expecting here (true)")}
# if false in $myary {notice("not really sure what I'm expecting (false)")}
# So the left operand of in must be a string, and this is documented. 
validate_bool($myary[2])
# Okay, so a bool of true persists in an array, but a bool of false does not -- it becomes a zero-length string. 

$thisarray = [true, false]
validate_bool($thisarray[0])
# validate_bool($thisarray[1])

$myhash = {'a' => true, 'b' => false}
validate_bool($myhash['a'])
# Ah, yup, same thing with hashes. 


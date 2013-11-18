# Is the $trusted hash actually immutable? (Yes, with fixes to PP-773 and PP-765. Tested commit 4622cbeb558020b2a6b7bf390038abf8ed1a3bf1.)

# CALIBRATION PATTERN
# $myvalue = $trusted['certname']
# notify {"From assignment: Certname is ${myvalue}, ok cool.":}
# notify {"Directly interpolating: Certname is ${trusted['certname']}, ok cool.":}

# Normal hash
$nottrusted = { 'authenticated' => 'local', 'certname' => 'fakepie.lan' }
# notice(spew($nottrusted))


# NORMAL UNTRUSTED HASH
# Can you add an element to a normal hash?

## Directly? YES!
$nottrusted['newkey'] = 'New value!'

## With template? YES!
$dumpvar = inline_template("
<% @nottrusted['other_new_key'] = 'Other new value!' %> lol
")

# Can you alter an existing element in a normal hash?

## Directly? NOPE!
# $nottrusted['certname'] = 'Whoops, owned'

## With template? YES!
$dumpvar2 = inline_template("
<% @nottrusted['certname'] = 'Whoops, owned' %> lol
")

# notice(spew($nottrusted))

# TRUSTED HASH

# Can you add an element to the trusted hash?

## Directly? NOPE!
# $trusted['newkey'] = 'Added new value to trusted!'

## With template? NOPE!
# $dumpvar3 = inline_template("
# <% @trusted['other_new_key'] = 'Other new value!' %> lol
# ")

# Can you alter an existing element in the trusted hash?

## Directly? NOPE!
# $trusted['certname'] = 'Whoops, owned'

## With template? NOPE!
# $dumpvar4 = inline_template("
# <% @trusted['certname'] = 'Whoops, owned' %> lol
# ")


notice(spew($trusted))


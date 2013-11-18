# Is the $trusted hash actually immutable? (Tested with a pre-3.4.0 release, where the key's name was clientcert instead of certname.)

# CALIBRATION PATTERN
# $myvalue = $trusted['clientcert']
# notify {"From assignment: Certname is ${myvalue}, ok cool.":}
# notify {"Directly interpolating: Certname is ${trusted['clientcert']}, ok cool.":}

# Normal hash
$nottrusted = { 'authenticated' => 'local', 'clientcert' => 'fakepie.lan' }
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
# $nottrusted['clientcert'] = 'Whoops, owned'

## With template? YES!
$dumpvar2 = inline_template("
<% @nottrusted['clientcert'] = 'Whoops, owned' %> lol
")

# notice(spew($nottrusted))

# TRUSTED HASH

# Can you add an element to the trusted hash?

## Directly? YES
$trusted['newkey'] = 'Added new value to trusted!'

## With template? YES
$dumpvar3 = inline_template("
<% @trusted['other_new_key'] = 'Other new value!' %> lol
")

# Can you alter an existing element in the trusted hash?

## Directly? NOPE!
# $trusted['clientcert'] = 'Whoops, owned'

## With template? YES!
$dumpvar4 = inline_template("
<% @trusted['clientcert'] = 'Whoops, owned' %> lol
")


notice(spew($trusted))


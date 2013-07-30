# Can you get undef from hiera? 
# Not really. You can supply undef as a default, and that'll be a true undef value if it falls through, but I'm not seeing any way to get Hiera to spit back an undef. Also, I'm seeing anomalous info from my spew function -- didn't undef used to inspect as something special, rather than just an empty String? 
$nothing_for_sure = hiera('nothing_for_sure', undef)
$nothing_maybe = hiera('nothing_maybe')

unless $nothing_for_sure {
  notice ('nothing for sure worked!')
}
unless $nothing_maybe {
  notice ('nothing maybe worked!')
}

notice (spew(undef))


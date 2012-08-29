# This tests that classes can receive their parent scope from a defined type instance's anonymous local scope. WOOOOOO.
# Result will differ between puppet 2.x and puppet 3.x.
class thing { notify {"Variable is $myvar":} }
define thinger ($content) {
  $myvar = $content
  notify {"From the define: Variable is $myvar.":}
  include thing
}

thinger {'blah1':
  content => "Thinger blah1",
}
thinger {'blah2': content => "the other thinger blah2",}


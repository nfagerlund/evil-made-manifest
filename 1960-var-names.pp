# issue 1960
$_other_var = "The other variable."

class foo-bar {
    $some_var = "The foo-bar variable."
}

class foo_baz_ {
    $some((var = "The foo_baz_ variable."
}

class includer {
    include foo_baz_
    notice("${foo_baz_::some((var}")
}

include includer
notice("${_other_var}")

# Legal class names: foo-bar (but can't reference qualified vars), foo_baz, foo_baz_, foo_bAz_, 1_foo_baz, fooBAZ, fOOBAZ...
# Illegal class names: -foo-bar, _foo_baz, Foo_baz...
# vars can't use . or (

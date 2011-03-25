# issue 1960

class foo-bar {
    $somevar = "The foo-bar variable."
}

class foo_baz_ {
    $somevar = "The foo_baz_ variable."
}

class includer {
    include foo-bar
    include foo_baz_
    notice("$foo-bar::somevar")
    notice("$foo_baz_::somevar")
}

include includer

# Legal class names: foo-bar (but can't reference qualified vars), foo_baz, foo_baz_, foo_bAz_, 1_foo_baz, fooBAZ, fOOBAZ...
# Illegal class names: -foo-bar, _foo_baz, Foo_baz...

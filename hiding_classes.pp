# http://projects.puppetlabs.com/issues/2053

class bar {
    notice("This is coming from class ::bar.")
    $somevar = "set in ::bar"
}

    class foo::bar {
      notice("Coming from class foo::bar.")
      $somevar = "set in foo::bar"
    }

class foo {
    include bar
    notice($bar::somevar)
}

include foo
# This will yield the "foo::bar" notice, not the bar one. 
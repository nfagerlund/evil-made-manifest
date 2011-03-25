# http://projects.puppetlabs.com/issues/2053

class bar {
    notice("This is coming from class ::bar.")
}


class foo {
    class bar {
      notice("Coming from class foo::bar.")
    }
    include bar
}

include foo::bar
# This will yield the "foo::bar" notice, not the bar one. 
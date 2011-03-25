# http://projects.puppetlabs.com/issues/2053

class bar {
    notice("This is coming from class ::bar.")
}

class foo::bar {
    notice("Coming from class foo::bar.")
}

class foo {
    include bar
}

include foo
# This will yield the "foo::bar" notice, not the bar one. 
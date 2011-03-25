# This actually works fine because the exec type has @isomorphic set to false!
# The titles still have to be different, though!

exec {"/bin/echo foo":
    name => "/bin/echo bar",
    # command => "/bin/echo baz",
    logoutput => true,
}


exec {"/bin/echo foo2":
    name => "/bin/echo bar",
    # cmeommand => "/bin/echo baz",
    logoutput => true,
}


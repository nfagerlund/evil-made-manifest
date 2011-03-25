# issue 1960

class foobar {
    $soMEVar = "The fooBAR variable."
    $somevar = "A cuckoo."
}

class foobar {
    $someothervar = "I cause problems!"
}

class includer {
    include FoOBar
    notice("$fOObaR::soMEVar")
    notice("$foobar::somevar")
    notice("$fooBAR::someothervar")
}

include includer


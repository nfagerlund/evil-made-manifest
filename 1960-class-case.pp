# issue 1960

class fooBAR {
    $soMEVar = "The fooBAR variable."
    $somevar = "A cuckoo."
}

class includer {
    include foOBar
    notice("$fOObaR::somevar")
}

include includer


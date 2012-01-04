# This is kind of wack -- if you're using the defined() function to test whether a class is DECLARED (by feeding it a resource reference referring to that class), it tests LEXICAL order instead of graph order. That is: as committed, seefirst status is true. If you reverse the order of the two class {'name':} statements in the file, it flips to false, even though the manifest's behavior SHOULD be identical.
# This basically just proves that you should never use defined() as though its name were declared(). 

class {'first':}
class {'second':
    before => Class['first'],
}

class second {
    $seefirst = defined(Class['first'])
    notify {"I'm second. seefirst status: $seefirst":}

}

class first {
    notify {"I'm first.":}

}


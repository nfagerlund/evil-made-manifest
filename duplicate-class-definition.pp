# See issue #11451 -- basically, you get duplicate definition errors when you declare a class twice. This proves that duplicate definitions merge cleanly, as documented.
class test {
    file {'/tmp/file1.txt': 
        ensure => file,
        content => 'blah1',
    }
}
class test {
    file {'/tmp/file2.txt':
        ensure => file,
        content => "Much more interesting content!",
}
# This is just here to show that the duplicate "definition" error is actually from duplicate declarations.
#     file {'/tmp/file1.txt':
#         ensure => file,
#         content => "busted!",
#     }
}

class {'test':}


class something {
    file {'/tmp/blah':
        ensure => file,
        require => Class['somethingelse'],
    }
}

class somethingelse {
    file {'/tmp/shouldntbehere.txt':
        ensure => file,
        content => 'you done fucked up',
    }
}

class {'something':}

# As expected, this blows up and doesn't implicitly declare the other class.

class myuser {
    user {"davexx": 
        home => '/home/someplace', 
        ensure => present,
        managehome => true,
    }
}
class myfile { 
    file {"/tmp/myfile": 
        ensure => file,
        owner => "davexx", 
    }
}

include myfile


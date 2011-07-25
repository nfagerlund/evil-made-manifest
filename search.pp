class mydefs {
    $somevar = "mydefs value"
    $othervar = "mydefs other value"
}

class myrefs {
    search mydefs
    notify {'blarg':
        message => "$somevar",
    }
    notify {"blug":
        message => "$othervar",
    }
}

include mydefs
include myrefs

Class['mydefs'] -> Class['myrefs']

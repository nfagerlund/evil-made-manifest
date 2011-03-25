class testclass($testparam::param, $fUCKEDUP) {
    notify {"$testparam::param":
        message => "$fUCKEDUP",
    }
}

class {"testclass":
    testparam::param => "some message",
    fUCKEDUP => "The actual message content",
}

# Can't start with an underscore
# hyphens are right out. 
# Starting with a number is fine. 
# Caps are fine as long as the first char is lowercase. 
# no unicode nonsense. 
# no colons. 
# This doesn't work, in case you were wondering. 
$somevar = false

notify {'test':
    message => "I'm your message!",
    case $somevar {
        true: {withpath => false}
        false: {withpath => true}
    },
}


# Works in future parser. (I originally guessed the syntax wrong, tho, so had to edit it.)
$somevar = false

notify {'test':
    message => "I'm your message!",
    withpath => case $somevar {
        true: {false}
        false: {true}
    },
}


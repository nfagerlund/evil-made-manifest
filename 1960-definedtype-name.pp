# defined type test 

define buLLE($nonsense) {
    notify {"title is ${title}; nonsense has been set to $nonsense": }
}

bulle { 'firstbullcrap':
    nonsense => "I can't believe it's not butter",
}

# name:
# Unicode is right out. Punctuation other than -_ is out. Can't start with - or _. CAN start with a number. Can't start with an uppercase letter, but otherwise case insensitive.

# params:
# Case sensitive. no hyphens. underscores ok. can't start with a capital letter. 
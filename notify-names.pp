# Notify resources can have dupe messages but not dupe names. 

notify {"notify1": 
    # name => "A notify!", #fails if other name is identically set
    message => "A message!",
}

notify {"notify2":
    # name => "A notify!", #fails if other name is identically set
    message => "A message!",
}


# Run this against markusq/ticket/next/5027.

# first, plain old vars, just to sanity test. 
$dinovar = "Top-scope Rex"
# Notify { message => "Top scope: $dinovar", }

class eyy {
    $dinovar = "Velociraptor"
    Notify { 
      # message => "eyy scope: $dinovar", 
      withpath => true,
    }
    include bee
}

class bee {
    notify {'beenotify':
        message => $dinovar,
    }
}

include eyy


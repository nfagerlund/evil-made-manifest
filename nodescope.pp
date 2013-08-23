#We don't have the ability to get at node scope explictly
#Because it is anonymous
#But we can do this

$msg = "hello from top scope"

class nodescope { }

class myparentclass {
    $msg = "hello from parent scope"
}

class myclass inherits myparentclass {
    $msg = "hello from class scope"

    notify { $msg: }
    notify { $::nodescope::msg: }

}


node default {
    $msg = "hello from node scope"

    include nodescope
    include myclass


}

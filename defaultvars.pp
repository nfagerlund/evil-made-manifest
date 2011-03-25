class somehost {
    $auth_aaa = "somehost"
}

class otherhost {}

$auth_aaa = "topscope"

class defaultnode {
    $the_host = "somehost"
    include $the_host
    $auth_aaa = $"$the_host"::auth_aaa
    notice($auth_aaa)
}

include defaultnode


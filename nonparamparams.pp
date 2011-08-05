class foobunk ($foo) {
    notify {"Foo is $foo":}
}

class {'foobunk':
    foo => "declared in the declaration",
}


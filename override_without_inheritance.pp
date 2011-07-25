file {'/tmp/overrider':
    ensure => file,
    content => "test content",
}

File['/tmp/overrider'] {
    owner => "nick",
    mode => 0640,
    # content => "override content",
}


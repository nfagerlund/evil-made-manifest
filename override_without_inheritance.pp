file {'/tmp/overrider':
    ensure => file,
    content => "test content",
}

File['/tmp/overrider'] {
    owner => "nick",
    mode => 0640,
    # content => "override content",
    # ensure => file,
}

# The experiment: Can I override attributes without inheriting? 
# The result: No, but I can add to them. 
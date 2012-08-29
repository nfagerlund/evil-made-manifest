# tags are case insensitive when used with --tags. 
class one {
    notify {"Class one":}
    tag supplementary_tag
}
class two {
    notify {"class two":}
}
class three {
    notify{"class three":}
}

include one
include three
class {'two':
  tag => '_.',
}



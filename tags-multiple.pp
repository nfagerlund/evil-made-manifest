class one {
    notify {"Class one":}
}
class two {
    notify {"class two":}
}
class three {
    notify{"class three":}
}

include one
include two
include three


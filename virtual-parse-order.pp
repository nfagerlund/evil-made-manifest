# Q: Is realizing a virtual resource parse-order dependent? 
# A: Nope! looking under the hood, it actually creates a one-item (or several-item) collection, and I already proved that collections are parse-order independent. 
# q: Do you have to include the class before virtual resources in it are parsed? Or is just loading the class enough?
# A: Yeah, gotta include it. 
# Q: Can exported collectors collect regular resources?
# NO, they can't. 

#realize File['/tmp/myvirtualfile.txt']
File <| title == '/tmp/myvirtualfile.txt' |>
# File <<| title == '/tmp/myvirtualfile.txt' |>>
include has_virtual
class has_virtual {
  @file {'/tmp/myvirtualfile.txt':
    ensure => file, 
    content => "Delete me or whatevs",
  }
}



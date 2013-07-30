# Can unless statements take an else or elsif block?
# NOPE!
# Do they get regex match vars?
# YES, although you have to contort a bit. Obviously this is useless.

unless ("some string" =~ /ring/) and 4==5 {
  notice("Firing on initial condition, matching portion is $0.")
}

# elsif 3 == 3 {
#   notice("Firing on fallback else condition")
# }


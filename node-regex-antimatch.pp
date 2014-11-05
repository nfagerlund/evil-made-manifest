# Can I make a non-matching regex match a node, as long as the regex reduces to a string identical to the node's name?
# This regex will match something like "gpillan", but won't match "magpie.lan".
# YES, it totally works. :(

node /(m|a)?gp(i|e).lan/ {
  notify {'hey it matched.':}
}

# Do regex nodes have differing levels of specificity? test with:
# puppet apply node-regex-specificity.pp --certname magpie.lan

node /pie/ {
  notify {'first node definition, reduces to "pie" ':}
}

node /gpie/ {
  notify {'second node definition with longer simple string in regex, reduces to "gpie" ':}
}

node /(g|o)pie/ {
  notify {'third node definition; matches same amount of the node name as second, but contains more characters in the regex, reduces to "gopie" ':}
}

node /(magpie)/ {
  notify {'fourth node definition, matches an entire hostname segment, reduces to "magpie" ':}
}

node /(magpie.la)/ {
  notify {'fifth, matches almost entire certname, reduces to "magpie.la" ':}
}

node /(m|z)agpie.la(n|d)/ {
  notify {'sixth, matches entire certname, reduces to "mzagpie.land" ':}
}

node /(mag)(pie).lan/ {
  notify {'seventh, matches entire certname, reduces to "magpie.lan" ':}
}

node /..g.i..la./ { # /
  notify {'eighth, matches entire certname, reduces to "g.i..la." (note first period is gone but last remains)':}
}


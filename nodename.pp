notice("$clientcert")
notice("$node_name")
notice("$fqdn")
notice("$nodename")

node 'magpie.lan' {
  notify {'this is magpie.lan':}
}

node 'fakepie.lan' {
  notify {'this is fakepie.lan':}
}
notice("$node_name_value")

#The test: is it possible to get the node name value if you overrode it? 
# The result: haha fuck no, you're stuck with the certname. 

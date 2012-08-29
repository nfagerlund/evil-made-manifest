# Do regex node names expose matching subpatterns as number variables?
# NOPE!
node /(pie|cake)/ {
  notify {"This node eats $1":}
  notice ($clientcert)
  if $clientcert =~ /(pie|cake)/ { notify{"this if eats $1":} }
}


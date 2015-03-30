$myvariable = "third"

if $myvariable == "first" {
  notify {"first":}
}
elsif $myvariable == "second" {
  notify {"second":}
}
elsif $myvariable == "third" {
  notify {"third":}
}
else {
  notify {"fourth":}
}

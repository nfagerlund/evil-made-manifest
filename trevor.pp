# class foo {
#   notify { "blah": }
# }
# 
# include foo
# 
# if defined( Class["foo"] ) {
#   notify { "found_foo": }
# }
# 
$foo = "blah2"

if defined( "foo" ) {
  notify { "found_foo2": }

}

$bar = "blah"

if defined( "bar" ) {
  notify { "found_bar": }

} 

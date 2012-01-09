# You can never, it turns out, test a boolean fact with a bare "if". That's because they're actually strings, and while false is false, "false" is true. 
# Interestingly, stdlib includes a function that can convert strings to booleans! So use that.
if str2bool($is_virtual) {
  notice("It's virtual!")
}
else {
  notice("It's physical!")
}


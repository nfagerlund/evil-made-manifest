# Let's try to concatenate strings in the future parser!

# This doesn't work because + is for numbers:
$mystring = "string one\n" + "string with interpolated #{5 + 17} expression" + "string two\n"

# ... This doesn't work either, because it treats it as left shift. :/
# $mystring = "string one\n" << "string with interpolated #{5 + 17} expression" << "string two\n"

# Guess it's not possible.

notify {"$mystring":}

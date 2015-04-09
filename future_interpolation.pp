notice("hi \' escaped single quote \" escaped double quote \ actual backslash")
# \' is still a recognized escape sequence, even though it's unnecessary.
notice("escaping \a a random character")
# A lone backslash followed by a character that isn't part of a recognized
# escape sequence (like a space or an a) logs a warning, prints a literal
# backslash plus the character, and continues (no error).

# PUP-4385:
notice("5 digit unicode \u1f452 hat") # 5 digit unicode ὅ2 hat :(
# notice("double 4 digit unicode \uD83D\uDC52 hat") # Error: Could not parse for environment production: invalid byte sequence in UTF-8 on node magpie.lan :( :( :(
notice("literal 👒 hat") # literal 👒 hat, works fine
# The resolution is that they're gonna add a new \u{x(xxxxx)} escape for one to six hex digits.

notice("baht immediately followed by new shequel \u0e3f\u20aa") # baht immediately followed by new shequel ฿₪ Chaining two unicode chars together works fine


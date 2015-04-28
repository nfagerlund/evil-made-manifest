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

notify {"hey":} notify {"yo":}

notice("string ${ Notify['hey'] -> Notify['yo'] } and more")
# Notice: Scope(Class[main]): string [Notify['yo']] and more
# wow that actually works

notice("string ${ Notify['hey'] {message => 'heeeeeyyyy'}} end")
# Notice: Scope(Class[main]): string Notify['hey'] end
# Notice: /Stage[main]/Main/Notify[hey]/message: defined 'message' as 'heeeeeyyyy'
# WOWWWWWWWWWWWWWWWWW

notice("string ${ notify{'wow':} }")
# Notice: Scope(Class[main]): string [Notify['wow']]
# Notice: /Stage[main]/Main/Notify[wow]/message: defined 'message' as 'wow'

# notice("string ${ notice 'statement inside a thing' } end")
# Error: Could not parse for environment production: Syntax error at 'statement inside a thing' at /Users/nick/Documents/manifests/future_interpolation.pp:34:26 on node magpie.lan

notice("string ${ 'statement inside a thing'.notice } end")
# Notice: Scope(Class[main]): statement inside a thing
# Notice: Scope(Class[main]): string statement inside a thing end

notice("string ${ notice('statement inside a thing') } end")
# Notice: Scope(Class[main]): statement inside a thing
# Notice: Scope(Class[main]): string statement inside a thing end
# OK whew, these act the same. I didn't know notice had a value other than undef; it must just get suppressed in a statement-style call.

# notice("string with ${ Notify <| |> { message => 'overridden' } } collector override")
# Error: Could not parse for environment production: Invalid use of expression. A Virtual Query does not produce a value at /Users/nick/Documents/manifests/future_interpolation.pp:43:24 on node magpie.lan

notice("string with ${ Notify { message => 'default' } } default")
# Notice: Scope(Class[main]): string with Notify default
# Notice: /Stage[main]/Main/Notify[wow]/message: defined 'message' as 'default'

class myclass { $myvar = "value from myclass" }
include myclass
notice("String with qualified $myclass::myvar:rest of string")
# Notice: Scope(Class[main]): String with qualified value from myclass:rest of string
# Interesting. So once it hits something where the remainder couldn't legally be part of the name, it stops and does the right thing, even if that point is a character that could, under other circumstances, be part of a variable name (:, basically).

$mynumber = 40
# notice("String with addition ${mynumber + 3}")
# Error: Evaluation Error: The value 'mynumber' cannot be converted to Numeric. at /Users/nick/Documents/manifests/future_interpolation.pp:57:32 on node magpie.lan
# NICE, I was really really not looking forward to having to explain that.

$mystring = "Here's a house of bees."
notice("Substring access ${mystring[5,-3]} cool")
# Notice: Scope(Class[main]): Substring access s a house of bee cool
# all access expressions are created equal it looks like.

notice("chain and access: ${::interfaces.split(",")[2]} is my interface of choice")
# Notice: Scope(Class[main]): chain and access: stf0 is my interface of choice
# Wow, cool. AND ALSO, that shows you can use double quotes in the interpolation token.

notice("a hash ${ {one => 1, 'three three'=>'hey, heeeeyyyy', two => twoooooo, } } ok")


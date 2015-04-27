# https://github.com/puppetlabs/puppet-specifications/blob/master/language/heredoc.md

# This is complicated. Okay, so,

$lineescape = @(EOT)
here's one line\
and here's another line\
and here's another.
EOT
# '

notice($lineescape)
# Notice: Scope(Class[main]): here's one line\
# and here's another line\
# and here's another.
#

# So by default, you can't escape line ends.

$lineescape2 = @(EOT/L)
here's one line\
and here's another line\
and here's another.
EOT
# '

notice($lineescape2)
# Notice: Scope(Class[main]): here's one lineand here's another lineand here's another.
#

# There we go.

$thing = "hi there"

notice(@("LITERAL_MULTI"/rnstL))
here's a line
here's two\n and three\t\tcontinued
A variable! $thing\
An escaped variable! \$thing
Same line with brackets! \${thing}
done.
LITERAL_MULTI

# With /rnstL:
# Notice: Scope(Class[main]): here's a line
# here's two
#  and three		continued
# A variable! hi thereAn escaped variable! \$thing
# Same line with brackets! \${thing}
# done.
#

# with nothing:
# Notice: Scope(Class[main]): here's a line
# here's two\n and three\t\tcontinued
# A variable! hi there\
# An escaped variable! \$thing
# Same line with brackets! \${thing}
# done.
#

# with /$:
# Notice: Scope(Class[main]): here's a line
# here's two\n and three\t\tcontinued
# A variable! hi there\
# An escaped variable! $thing
# Same line with brackets! ${thing}
# done.
#

# I think I'm seeing a language bug here.

notice(@("END INTERP"))
This string should be able to interpolate variables, and all backslashes should
be interpreted as plain old literal backslashes.
Variable standing apart: ${thing}
Variable enjambed: hey${thing}
Variable with single backslash enjambed: \${thing}
Variable with double backslash enjambed: \\${thing}
END INTERP

# Notice: Scope(Class[main]): This string should be able to interpolate variables, and all backslashes should
# be interpreted as plain old literal backslashes.
# Variable standing apart: hi there
# Variable enjambed: heyhi there
# Variable with single backslash enjambed: \${thing}
# Variable with double backslash enjambed: \\hi there
#

# Identical results with 3.7.5 and 4.0.0.
# That is 100% a bug. Filed PUP-4462.

notice(@("END INTERP"/$))
This string should be able to interpolate variables, and all backslashes should
be interpreted as plain old literal backslashes.
Variable standing apart: ${thing}
Variable enjambed: hey${thing}
Variable with single backslash enjambed: \${thing}
Variable with double backslash enjambed: \\${thing}
END INTERP

#/
# This, on the other hand, works as expected.
# Notice: Scope(Class[main]): This string should be able to interpolate variables, and all backslashes should
# be interpreted as plain old literal backslashes.
# Variable standing apart: hi there
# Variable enjambed: heyhi there
# Variable with single backslash enjambed: ${thing}
# Variable with double backslash enjambed: \hi there
#

notice(@("OTHER ESCAPES"/n))
How about those escaped quotes? \' and \". What's the word?
OTHER ESCAPES
#/

# Notice: Scope(Class[main]): How about those escaped quotes? \' and \". What's the word?
# Okay, as specified.

# Unicode?

notice(@(UNICODE/nu))
Recycle! \u267A right?
UNICODE
# ah, the heredoc page in the spec was out of date, but https://github.com/puppetlabs/puppet-specifications/blob/master/language/lexical_structure.md#heredoc seems correct.

# Do qualified vars need the curlies?
class heya { $thing = "from heya" }
include heya
notice("Var sup$heya::thing/hi is here")
# Notice: Scope(Class[main]): Var supfrom heya/hi is here
# nope it's fine.


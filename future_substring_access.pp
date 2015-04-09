# Whoa, you can use access brackets to get substrings. This is new.

# notice("${'this is my string'[0,6]}")
$strang = 'this is my string'
$strung = $strang[0,6]
notice($strung)

# Documented in the spec in expressions.md, under the heading ### String Value [ ]
# It's "string"[<START>,<LENGTH OR OFFSET FROM END>]. Positive second values are lengths, negatives are offsets from end.


# The offset from end is 1-indexed, not 0-indexed.
notice("hi there I'm a string"[1,-2]) # i there I'm a strin
notice("hi there I'm a string"[-5,2]) # tr
notice("hi there I'm a string"[-5,-2]) # trin
notice("hi there I'm a string"[-5,-7]) # (empty string)

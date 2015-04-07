# regex equality? sure.

notice(/t[est]/ == /t[est]/) # true
notice(/t[est]/ == /te[st]/) # false

# types, which I feel like we covered elsewhere but

notice(File == Resource) # false, whew.
notice(File < Resource) # true
notice(File['/tmp/thing'] < File)

notice( "thing" =~ /t[hi]{2}ng/ ) # true
$myregex = /t[hi]{2}ng/
notice( "thing" =~ $myregex ) # true
$mystringregex = "t[hi]{2}ng"
notice( "thing" =~ $mystringregex ) # true
# notice( ["thing", "other"] =~ $myregex ) # error

notice(File <= Resource) # true

notice(1 == Integer) # false and OK
# notice(1 <= Integer) # error!

notice('Eat' in ['eat', 'ate', 'eating']) # true!
notice('Eat' in { 'eat' => 'present tense', 'ate' => 'past tense'} ) # true! That one actually probably isn't what you want...

notice( Integer[100, 199] in [1, 2, 125] ) # true
notice( Integer[100, 199] in 125 ) # false but not error.
notice( String in "hi there" ) # false as well.
notice( /[aeiou]+t/ in { 'eat' => 'present tense', 'ate' => 'past tense'} ) # true
notice( /[aeiou]+tt/ in { 'eat' => 'present tense', 'ate' => 'past tense'} ) # false

# How's array addition work?
notice( [1, 2, 3] + 1 )     # [1, 2, 3, 1]
notice( [1, 2, 3] + [1] )   # [1, 2, 3, 1]
notice( [1, 2, 3] + [[1]] ) # [1, 2, 3, [1]]

# How's array subtraction work?

notice( [1, 2, 3, 4, 5] - 1 )                   # [2, 3, 4, 5]
notice( [1, 2, 3, 4, 5, 1, 1] - 1 )             # [2, 3, 4, 5]
notice( [1, 2, 3, 4, 5] - 1 - 1 - 2)            # [3, 4, 5]
notice( [1, 2, 3, 4, 5] - [1, 3] )              # [2, 4, 5]
notice( [1, 2, 3, 4, 5] - [[1]] )               # [1, 2, 3, 4, 5]
notice( [ {a => 1}, {b => 2}, 2 ] - {b => 2} )  # [{a => 1}, {b => 2}, 2] -- so huh, only scalar values get the automatic array wrapping.
notice( [ {a => 1}, {b => 2}, 2 ] - [{b => 2}] )# [{a => 1}, 2]
notice( [ {a => 1}, {b => 2}, 2 ] - 2 )         # [{a => 1}, {b => 2}]

notice( [ {a => 1}, {b => 2}, 2 ] + {b => 2} )    # [{a => 1}, {b => 2}, 2, [b, 2]] -- WUT
notice( [ {a => 1}, {b => 2}, 2 ] + [{b => 2}] )  # [{a => 1}, {b => 2}, 2, {b => 2}] -- ok that's more like it


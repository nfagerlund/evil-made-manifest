# The other file got too big to read the output.

notice( Scalar < Data ) # true
notice( String < Scalar ) # true

notice( default =~ Data ) # false!

notice( Pattern < Data ) # true
notice( Enum < Data ) # true
notice( Pattern < String ) # false
notice( Pattern == String ) # true
notice( Enum < String ) # false

notice( Pattern[/^aoeu.*/] == String[0, 6] ) # false, and < and > are both false too
notice( Pattern[/^aoeu.*/] < String ) # true
notice( Pattern[/^aoeu.*/] < String[4] ) # false, and < and > are both false too

notice( Enum["one", "two"] < String[0, 6] ) # true
notice( Enum["one", "two"] > String[0, 2] ) # false


$myary = [1, 3, "hi", "yo", "hey"]

notice( $myary =~ Tuple[Integer, Integer] ) # false
notice( $myary =~ Tuple[Integer, Integer, default, default] ) # false
notice( $myary =~ Tuple[Integer, Integer, String, default, default] ) # true
notice( [1, 3] =~ Tuple[Integer, Integer, String, default, default] ) # true!!!!
notice( [] =~ Tuple[Integer, Integer, String, default, default] ) # true! so default min is 0.

# notice( { [a, b] => 'c' } =~ Struct[ { [a, b] => String } ] )
# Error: Evaluation Error: Error while evaluating a '[]' expression, In Puppet::Pops::Types::PStructElement : Can not use a Array where a String is expected at /Users/nick/Documents/manifests/future_datatypes_even_more.pp:30:30 on node magpie.lan
# So structs demand string keys. I think.

# notice( { [a, b] => 'c' } =~ Struct[ { 2 => String } ] )
# Error: Evaluation Error: Error while evaluating a '[]' expression, In Puppet::Pops::Types::PStructElement : Can not use a Fixnum where a String is expected at /Users/nick/Documents/manifests/future_datatypes_even_more.pp:34:30 on node magpie.lan
# Yeah.

notice( { [a, b] => 'c' } =~ Struct[ { c => String } ] )

# Is enum case sensitive?
notice( "hey there" =~ Enum["HEY THERE"] ) # false
# Yup, it is!

notice(-5 =~ Integer[default, 0]) #true
# notice(-5 =~ Integer[-Infinity, 0]) # error. So Justin was using meta-code but surrounding it in code spans. OK, sure.

notice( [5, 5, undef, ["three"], Integer] =~ Array[Data] ) # false
notice( [5, 5, undef, ["three"], Integer] =~ Data ) # false
notice( [5, 5, undef, ["three"], Integer] =~ Array ) # false, per henrik's note that Array == Array[Data]. come to think of it,
notice( Array == Array[Data] ) # true
notice( Array == Array[Any] ) # false wow, ok, it is thus proven.
# So that should make it easier to test his next assertion, which is:
notice( Hash == Hash[Scalar, Data] ) # true

# "- Collection is equal to Variant[Array[Any], Hash[Any, Any]]"
notice( Collection == Variant[Array, Hash] ) # false
notice( Collection == Variant[Array[Any], Hash[Any, Any]] ) # ...also false.
notice( Collection < Variant ) # false :| :| :| :| :| clearly a different tack is needed
notice( [5, 5, undef, ["three"], Integer] =~ Collection ) # true
notice( [5, 5, undef, ["three"], Integer] =~ Variant[Array, Hash] ) # false as expected
notice( { a => b, [a, c] => Integer } =~ Hash[Any, Any] ) # true
notice( { a => b, [a, c] => Integer } =~ Hash ) # false
notice( { a => b, [a, c] => Integer } =~ Collection ) # true
# Okay, finally. So it's not implemented in terms of Variant, but it'll do the same thing as the specified Variant.

notice( String[3] =~ Type[String] ) # true. Subtypes match the type of their parent type.
notice( String[3,6] =~ Type[String[3]] ) # true. Subtypes match the type of their parent type.
notice( String =~ Type[String[3]] ) # False. Not vice versa.

notice( $never_set =~ Undef ) # true
notice( Resource < Collection) # false

# Hey, are classes really a special-case thing?
notice( Class < Resource ) # false
notice( Class[myclass] =~ Type[Resource] ) # false
notice( File['/tmp/myfile'] =~ Type[Resource] ) # true
notice( Class[myclass] =~ Type[Class] ) # true
# Yup, sure are.


# Arbitrary whitespace in a type parameter list is fine, right?

notice( "true" =~ Enum[
  'running',
  'true',
  'false',
  'stopped'
] ) # true, so yup.

# How about trailing commas? DISALLOWED!

# notice( "true" =~ Enum[
#   'running',
#   'true',
#   'false',
#   'stopped',
# ] )


notice( blah =~ Optional[Variant[Enum[
  'running',
  'true',
  'false',
  'stopped'
], Boolean]] ) # takes undef, true, false, the quoted strings, and nothing else.


notice( ['string', Array] =~ Collection) # true, so collection really does match Array[Any].

notice( [1, 2, 3, 4] =~ Array[Data, default, default] )

notice( [] =~ Array[Data, default, default] )

# Can you leave off the value type for a hash? NOPE, must give 0, 2, 3, or 4 parameters.

# notice( {a => 'b'} =~ Hash[String] ) # Error

notice( {a => 'b'} =~ Hash[String, String, default, 1] ) # true

notice( "hi there" =~ String[default, default] ) # true, so default works in length again.

notice( "👒" =~ String[1, 1] ) # true, so it's by unicode char and not byte.

notice( 2/3 )

notice( -1.555 =~ Float[default, 0] ) # true, so default works.
notice( 3.501 =~ Float[1.6, 3.501]) # true, so limits are inclusive.

# notice( 3.501 =~ Numeric[1.6, 3.501]) # error - takes no parameters.

notice( Integer =~ Type[Any] ) # true
notice( 5 =~ Type[Any] ) # false
# OK good, i guessed that default parameter value right.

notice( Enum == String ) # true??????
notice( Enum["hi"] == String ) # false??????
# OK, so enum is actually the same as string in the abstract, but because it takes parameters, like... hmm.
notice( Enum["hi"] <= String[2] ) # true
notice( Enum["hi"] <= String[3] ) # false whoa
notice( Enum["hi", "bye"] <= String[3] ) # false whoa
notice( Enum["hi", bye] < String[2] ) # true
# So a given enum type is less than any string type that would match ALL of its members.
notice( Enum["hi", "bye"] >= String[3] ) # false
# K, so it's not vice versa.

notice( Integer < Numeric ) # true
notice( Integer =~ Type[Numeric] ) # true

notify {'hi':}
notify {'yo':}
file {'/tmp/foo':}

$mytype = 'notify'

# (Resource[$mytype]) <| |> -> Resource[File, '/tmp/foo'] # ILLEGAL.
Notify <| |> -> Resource[File, '/tmp/foo'] # This is ok.

# So, general form of resource type data types are not allowed in collector statements.


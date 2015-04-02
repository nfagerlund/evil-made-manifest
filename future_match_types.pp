# OK, so we know from talking with henrik that File[foo] !~ File, because it's not actually a resource, it's a resource reference. And as such, it's a TYPE, not a value whose type is File. (Same if you used an actual resource declaration behind the ~, because the VALUE of a resource declaration is a resource reference.)

# So,

notice("Is File Type? ${File['foo'] =~ Type}") # yes
notice("Is File Type[file]? ${File['foo'] =~ Type[File]}") # yes
notice("Is File Resource? ${File['foo'] =~ Resource}") # no, because it's not a MEMBER, it's a SIBLING.
notice("Is File Resource File? ${File['foo'] =~ Resource[File]}") # No. Same as above, but even closer siblings.
notice("Is File Type Resource? ${File['foo'] =~ Type[Resource]}") # Yes.
notice("Is File foo Type File foo? ${File['foo'] =~ Type[File[foo]]}") # yes, with or without quotes. Looks like it handles the munging.
notice("Is File foo Type File bar? ${File['foo'] =~ Type[File[bar]]}") # No, as expected.
# notice("Is an actual resource declaration Type File? ${ (file {'/tmp/foo': ensure => absent,}) =~ Type[File] }") # ...no????

# $myfile = file {'/tmp/foo': ensure => absent,}
# notice(spew($myfile[0])) # well wtf is it then??? IT'S AN ARRAY OF RESOURCE REFERENCES????

notice("Is the first member of the value of an actual resource declaration Type File? ${ (file {'/tmp/foo': ensure => absent,})[0] =~ Type[File] }") # ...Yes.

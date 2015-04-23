# Docs commit 46679b0f167fbc6716d9c52df910d4217ef5e165, what in the world??

Resource[File] { "/tmp/testfile1":
  ensure => file,
  content => "hi, I guess that worked?",
}

# Well, yup. Wow. Hmm:

notice(File == Resource[File])

# Which means this should also work, and in actual fact, it totally does.

File { "/tmp/testfile2":
  ensure => file,
  content => "hi, I guess that worked too?",
}

# (Note that this fails:)

# "file" { "/tmp/testfile3":
#   ensure => file,
#   content => "hi, I guess that worked?",
# }


# How about:

# File["/tmp/testfile4"] { "/tmp/testfile":
#   ensure => file,
#   content => "no WAY that worked, right?",
# }

# That one actually DOESN'T work, because:
# Error: Evaluation Error: Illegal Resource Type expression, expected result to be a type name, or untitled Resource, got File['/tmp/testfile']
# Fascinating.


# Also fascinating is that the following doesn't work, and I don't understand why. I guess expressions aren't legal there, just literals?

# $mytype = Resource[File]
#
# $mytype { "/tmp/testfile5":
#   ensure => file,
#   content => "hi, I guess that worked?",
# }

# Except THIS works, in both variations:

# $mytypename = file
# $mytypename = File
$mytypename = "file"

Resource[$mytypename] { "/tmp/testfile6":
  ensure => file,
  content => "hi, I guess that worked??",
}

# How about:

# $mytypename { "/tmp/testfile7":
#   ensure => file,
#   content => "hi, I guess that worked?",
# }

# Predictably, given parts 3 and 5: no.



# So that means the resource type can be two things:
  # The name of the resource type, lowercased, as a bare word that functions as a keyword rather than a string. (
  # A literal of a Type, which specifically must be a subtype of Resource, and which also specifically must NOT have a title.

# How about resource defaults using strings instead of types?

# notify {
#   message => "default message",
# }
# This is illegal, and results in:
# Error: This Block Expression has no effect. A value-producing expression without other effect may only be placed last in a block/sequence at /Users/nick/Documents/manifests/future_resource_reference_as_type.pp:76:1
# Error: This Name has no effect. A value-producing expression without other effect may only be placed last in a block/sequence at /Users/nick/Documents/manifests/future_resource_reference_as_type.pp:76:1

$mydefaultstype = notify
Resource[$mydefaultstype] {
  message => "default message",
}
# That, on the other hand, works fine. So, the type of a resource defaults statement has to be a type, not a string.

notify {'mynotify':}

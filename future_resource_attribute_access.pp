# investigating for DOC-1157. I heard this was possible, and the spec says:

# The `[ ]` operator supports access to Resource instance attributes:
#
# * the set attribute value of a resource parameter can be accessed
#
# The various forms are detailed in the following sub-sections.

# ...but then it never actually shows how to do that. So:


# How about before the resource is written in the file?
# notice( spew( File["/tmp/accessed_file.txt"]["content"] ))
# Error: Evaluation Error: Resource not found: File['/tmp/accessed_file.txt'] at /Users/nick/Documents/manifests/future_resource_attribute_access.pp:13:15 on node magpie.lan
# Nice.

file { "/tmp/accessed_file.txt":
  ensure => file,
  content => "This is a puppet manifest test; let's see if I can access this value",
}

notice( spew( File["/tmp/accessed_file.txt"]["content"] ))
# Notice: Scope(Class[main]): ["This is a puppet manifest test; let's see if I can access this value"]
# [String]

# Welp, oh my god.

# How about unset values?
notice( spew( File["/tmp/accessed_file.txt"]["mode"] ))
# Notice: Scope(Class[main]): [nil]
# [NilClass]

# Reminder that nil is undef:
notice( undef == File["/tmp/accessed_file.txt"]["mode"] )
# Notice: Scope(Class[main]): true

# How about values that default to something?
notice( spew( File["/tmp/accessed_file.txt"]["path"] ))
# Notice: Scope(Class[main]): [nil]
# [NilClass]

# Interesting. So it has to be in the actual original expression, even if you could derive it without looking at the target system.

# How about attributes that don't exist?
# notice( spew( File["/tmp/accessed_file.txt"]["bogus_attribute"] ))
# Error: Evaluation Error: The resource File['/tmp/accessed_file.txt'] does not have a parameter called 'bogus_attribute' at /Users/nick/Documents/manifests/future_resource_attribute_access.pp:45:15 on node magpie.lan

# or with illegal names?
# notice( spew( File["/tmp/accessed_file.txt"]["I have spaces and Capital Letters!"] ))
# same:
# Error: Evaluation Error: The resource File['/tmp/accessed_file.txt'] does not have a parameter called 'I have spaces and Capital Letters!' at /Users/nick/Documents/manifests/future_resource_attribute_access.pp:49:15 on node magpie.lan

# ------------------------------

# Before a resource default statement
notice( spew( File["/tmp/accessed_file.txt"][owner] ))
# Notice: Scope(Class[main]): [nil]
# [NilClass]

File { owner => 'nick' }

# After a resource default statement
notice( spew( File["/tmp/accessed_file.txt"][owner] ))
# Notice: Scope(Class[main]): ["nick"]
# [String]
# So defaults apply, but they're also evaluation order dependent.

# ------------------------------

File <| title == "/tmp/accessed_file.txt" |> { group => staff }

# After a collector override
notice( spew( File["/tmp/accessed_file.txt"][group] ))
# Notice: Scope(Class[main]): [nil]
# [NilClass]
# Per the spec, overrides apply late.

# -------------------------------

notice( spew( File["/tmp/accessed_file.txt"][replace] ))
# Notice: Scope(Class[main]): [nil]
# [NilClass]

File["/tmp/accessed_file.txt"] { replace => false }

notice( spew( File["/tmp/accessed_file.txt"][replace] ))
# Notice: Scope(Class[main]): [false]
# [FalseClass]

# So amendments AREN'T processed late.

# -------------------------------

define mytype ($one = "default value", $two) {
  notify {"$one and $two":}
}

mytype { "thing":
  two => "uheatnsuh",
}

notice( spew( Mytype["thing"][one] ))
# Notice: Scope(Class[main]): [nil]
# [NilClass]

notice( spew( Mytype["thing"][two] ))
# Notice: Scope(Class[main]): ["uheatnsuh"]
# [String]


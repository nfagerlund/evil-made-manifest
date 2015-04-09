notice("my string" =~ /^my string$/) # true
notice("my string" =~ /\Amy string\z/) # true
notice("my string" =~ /\Amy stringgg\z/) # false
# .... so the bit about \A and \z being disallowed at https://github.com/puppetlabs/puppet-specifications/blob/master/language/lexical_structure.md#regular-expressions seems to not be true? What would definitively prove this?
notice("my string\nhey second line" =~ /\Amy string\Z/) # false
notice("my string\nhey second line" =~ /^my string$/) # true, So, ok....
notice("my string\n" =~ /\Amy string\z/) # false
notice("my string\n" =~ /\Amy string\Z/) # true
notice("hey\nmy string\n" =~ /\Amy string\Z/) # false

# this is looking like that's not the case at all.




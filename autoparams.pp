# Can Nick get autoparam lookup working? 
# YES, except that the hiera.yaml file can't expand ~ for some reason! Is this only when Puppet is using it? Did it work fine with the command line one? Can't remember, don't feel like testing right now. Come back to this. 
# Can resource-like decs autolookup selectively?
# YES! mandatory params detour to hiera before failing, so you can be parsimonious w/ the params you override. 

# does puppet autolookup params for classes from an ENC?
# YES, at least w/ the array-style classes. 
# Does puppet mimic the resource-like syntax for classes w/ a params hash from an ENC?
# YES, it'll autolookup anything you neglect to override. 

# What happens when you use the hash syntax in an ENC and the class was already declared in the site manifest with 'include':
  # When the params hash is empty?
  # DUPE DECL ERROR
  # When the params hash is populated?
  # DUPE DECL ERROR
  # So in summary, the hash syntax in an ENC perfectly mimics the resource-like syntax in a manifest. 

class testclass ($param1 = "Has a default", $param2, $param3) {
  $allparams = [$param1, $param2, $param3]
  notify {$allparams:}
}

include testclass
# class {'testclass':
#   param2 => "Value from the class declaration",
# }

# notice( hiera('testkey') )



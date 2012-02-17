# Prove that you can access hashes from templates w/ scope.lookupvar.
class myclass {
  $myhash = { key1 => 'val1', key2 => 'val2' }

  notice ("key1 is ${myhash[key1]}")


  $mytemplate = '<% othervar = scope.lookupvar("myclass::myhash")["key1"] %><%= othervar %>'
  notice(inline_template($mytemplate))
}

include myclass


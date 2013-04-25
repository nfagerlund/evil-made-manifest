# Does the tidy type properly leave alone files for which there's already a file resource?
# YES.

# During compile:
# Notice: /Stage[main]//Tidy[/tmp/jars]: Tidying File[/tmp/jars/my_jar.1.2.6.jar]
# Notice: /Stage[main]//Tidy[/tmp/jars]: Tidying File[/tmp/jars/my_jar.2.4.4.jar]
# Notice: /Stage[main]//Tidy[/tmp/jars]: Tidying File[/tmp/jars/my_jar.2.4.5.jar]
# Notice: /Stage[main]//Tidy[/tmp/jars]: Tidying File[/tmp/jars/my_jar.2.4.6.jar]
# Info: /File[/tmp/jars/my_jar.2.4.6.jar]: Duplicate generated resource; skipping
# Info: Applying configuration version '1366914277'

# pushd /tmp/jars ; touch my_jar.2.4.6.jar my_jar.2.4.5.jar my_jar.2.4.4.jar my_jar.1.2.6.jar more not_my_jar.2.4.3.jar stuff unrelated unrelated2 ; popd

file {'/tmp/jars/my_jar.2.4.6.jar':
  ensure => file,
  content => "heya",
  mode => 0644,
}

tidy {'/tmp/jars':
  recurse => true,
  matches => "my_jar.*.jar",
}

# Is the implementation wart that you must set 'path' to false to use a remote filebucket still true? YES.
 # That is, if you set a "server" attribute but don't set "path," it won't cause a change of behavior and will just use a local filebucket.

# If you don't set a 'server' attribute, will it use a default and go with a remote filebucket anyway? YES (assuming you set path to false). 

# This manifest should be tested with:
# puppet master --verbose --debug --no-daemonize --manifest filebucket_attribute_precedence.pp
# puppet agent --server <server> --test --debug
# ...then change the content of the file a bunch of times while re-running the agent. You'll see debug messages when it buckets something. 
# Make sure you have different bucketdir and clientbucketdir settings, as is the default. You can then use find <dir> | grep <md5> to see which one the content landed in. 
filebucket {'main':
  # path => false,
  server => "magpie.lan",
}

File { backup => main, }

file {'/tmp/twiddler':
  ensure => file,
  content => "r,c.gpr,c.bkbkbkbkbk,.cgp",
}


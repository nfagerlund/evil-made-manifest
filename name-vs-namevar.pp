# Testing what happens when you specify both "name" and a non-name namevar. 
# RESULTS: It's parse-order dependent, yay! Last one wins.

file {'myfile':
  ensure => file,
  content => "hi there",
  path => "/tmp/pathfile",
  name => "/tmp/namefile",
}

exec {'myexec':
  logoutput => true,
  name => '/opt/local/bin/cowsay "from name"',
  command => '/opt/local/bin/cowsay "from command"',
}

file {'myfile':
  ensure => file,
  content => "hi there",
  path => "/tmp/pathfile",
  name => "/tmp/namefile",
}

exec {'myexec':
  logoutput => true,
  command => '/opt/local/bin/cowsay "from command"',
  name => '/opt/local/bin/cowsay "from name"',
}

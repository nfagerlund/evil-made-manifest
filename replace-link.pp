# This is for demonstrating that force still takes effect when replacing a directory w/ a link
# Force is even requireed when ensuring absent!
file {'/tmp/mydir':
  ensure => absent,
#  target => '/tmp/growlitunesart',
#  force => true,
}


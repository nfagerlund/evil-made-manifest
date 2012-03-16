# This is for demonstrating that force still takes effect when replacing a directory w/ a link
file {'/tmp/mydir':
  ensure => link,
  target => '/tmp/growlitunesart',
  force => true,
}


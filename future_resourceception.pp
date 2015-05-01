# Okay, so but like listen,

notify {"mynotify":
  message => (file {"/tmp/whatnow": ensure => file, content => "NO WAY",}),
}
# Notice: /Stage[main]/Main/File[/tmp/whatnow]/ensure: defined content as '{md5}9da67579fe1275e6ddc356394c1ad2d2'
# Notice: File[/tmp/whatnow]
# Notice: /Stage[main]/Main/Notify[mynotify]/message: defined 'message' as 'File[/tmp/whatnow]'

# The parens are mandatory because of precedence but wow, yes, that totally works.
# So it looks like using the semicolon at the end of the block like that, on a newline, works fine. So does putting a semicolon directly after the colon!
notify {
  default:
    message => 'did this work. yoes or no.',
  ;
  mynotify:;
}
# Notice: /Stage[main]/Main/Notify[mynotify]/message: defined 'message' as 'did this work. yoes or no.'

# The default doesn't have to go first.
notify {
  'second':;
  default:
    message => 'How about switching up the order?',
  ;
}
# Notice: /Stage[main]/Main/Notify[second]/message: defined 'message' as 'How about switching up the order?'

# How about multiple defaults per block?
# notify {
#   default:
#     message => "first default",
#   ;
#   'third':;
#   default:
#     message => 'second default?',
#   ;
# }
# OK good, that's illegal: Error: Evaluation Error: The title 'default' has already been used in this resource expression at /Users/nick/Documents/manifests/new_style_resource_defaults.pp:20:1 on node magpie.lan


$h1 = {tag => ['hi']}
$h2 = {message => "Hello there!"}

notify {
  default:
    * => $h1,
  ;
  "a hello":
    * => $h2,
  #   * => $h1, # can't splat twice
  #   message => "other message", # can't do an attribute twice
}

# But you can use + to merge hashes:
notify {'combined':
  * => $h1 + $h2,
}


# Don't need a space between the splat and the arrow:
$myattrs = {"message" => "from a reference attribute block"}
notify {'extra': *=> $myattrs }
# ...just like any other attribute:
notify {'next': message=> 'messaging'}

# Can you quote an attribute, normally?
# notify {'quoted':
#   "message" => "My message is quoted.",
# }
# NO: Error: Could not parse for environment production: Syntax error at 'message' at /Users/nick/Documents/manifests/future_resource_splats.pp:29:3 on node magpie.lan
# So, they're keywords of some kind and always have to be literal. And a splatted hash can get around that.

# How about busted attributes? I assume they break.
# $busted = {"not_an_attribute" => "bogus value"}
# notify {'busted': *=> $busted}
# Error: Invalid parameter not_an_attribute on Notify[busted] at /Users/nick/Documents/manifests/future_resource_splats.pp:35 on node magpie.lan
# Yeah.


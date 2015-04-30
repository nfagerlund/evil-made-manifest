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


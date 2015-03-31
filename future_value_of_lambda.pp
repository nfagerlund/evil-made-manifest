$messages = [ 'good morning', 'good day', 'good evening']
$notifies = $messages.map |$message| {
  notify { $message: }
}

notice( spew( $notifies ) )

# Wow, yup, so we already knew the map function produces an array of all the values its block produced, where each of those is the final statement in the black. And if that's a resource declaration, it produces an array of resource references.
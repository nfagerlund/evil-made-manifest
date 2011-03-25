notify{'first':}
notify{'second':
    subscribe => Notify['first'],
    # Note that notifies can't refresh. 
}

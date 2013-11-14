# When do secondary classes float out of a stage?
# When unanchored and uncontained?
  # ONLY if you also include the secondary class somewhere outside the first class; then it becomes a parse order race.
# When anchored?
  # Parse order race: Will create dependency cycle if secondary class is also included outside.
# When contained?
  # Parse order race: Will create dependency cycle if secondary class is also included outside.

class mine::secondary {
  notify {"The notify in mine::secondary.":}
}

class mine {
  notify {"The first notify in mine.":}
  notify {"The second notify in mine.":}
  include mine::secondary

  # Anchor style:
#   anchor {"one":} -> Class['mine::secondary'] -> anchor {"two":}
  # Contain style:
  contain mine::secondary
}

notify {"The first notify outside.":}
# Testing whether the secondary class will float out from between these two outside notifies:
# -> class {'mine':} ->
notify {"The last notify outside.":}

# Including the secondary class outside the main one, before the main one is declared
include mine::secondary

stage {'pre':
  before => Stage['main'],
}

class {'mine':
  stage => pre,
}

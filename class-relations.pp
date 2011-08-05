class foomar29 {
  notify{"I'm foo.":}
  Class['foomar29'] <- Class['barmar29']

}

class barmar29 {
  notify{"And I'm bar.":}

}

include barmar29

include foomar29

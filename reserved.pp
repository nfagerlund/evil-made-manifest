
class package {
  notify {'something':}
}

include package
class include {
  notify {'something ilse':}
}
include include

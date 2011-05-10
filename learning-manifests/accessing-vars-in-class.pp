class hasavar::something {
  $somevar = "I'm in class hasvar::something!"
}

class {'hasavar::something':}

$var = $hasavar::something::somevar
notice ($var)

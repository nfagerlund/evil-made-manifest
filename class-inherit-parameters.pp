# This was to check whether a parameterized class can ever be a base class. Answer: NO.
class my_base {
  notify {'base':
    #message => "First is $first, second is $second, third is $third",
    message => 'whatever',
  }
}

class my_derived ($first, $second, $third) inherits my_base {
  notify {'derived':
    # message => "blah",
    message => "First is $first, second is $second, third is $third",
  }
}

class {'my_derived':
  third => 'blah',
  second => 'meh',
  first => 'WOOOOOO',
}


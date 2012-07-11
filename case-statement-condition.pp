# Testing whether you can have arbitrary fragments in a case statement condition. looks like you can!
$myvar = 80

  #case $myvar > 40 {
  case file('/Users/nick/Documents/manifests/myfile.txt') {
  '30': { notice ('thirty') }
  '40': { notice ('fourty') }
  'true': {notice('haha, thats not a string!')}
  true: {notice('okay, true it is')}
  default: {notice ('lawl!')}
}


# Testing whether you can have arbitrary fragments in a case statement condition. looks like you can!
# Second test: can you use variables and expressions in cases? 
# Answer: Variables yes, expressions NO.
# third test: comma separated lists, are spaces okay? (YES)
# fourth test: Duplicate cases: okay? (YES)
# fifth test: do regex scope variables persist beyond the code block? (NO)
# sixth test: can you use a selector as a case? (NO)
$myvar = 80
$varsel = 90
case $myvar - 40 {
  file('/Users/nick/Documents/manifests/myfile.txt'): { notice('from the file!') }
  '30': { notice ('thirty') }
  #(20+20): {notice('expression fourty')}
  #$varcase: { notice('variable fourty') }
  #/(20|40)/: { notice ("fourty ($1)") }
  $varsel ? { 30 => "nothing", 90 => '40',}: { notice('back-nested fourty')}
  'true': {notice('haha, thats not a string!')}
  true: {notice('okay, true it is')}
  default: {notice ('lawl!')}
}

notice( "Anything left in the regex subpattern stack? $1")


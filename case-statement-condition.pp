# Interesting changes to this from the future parser!
# Expressions are OK.
# Strings aren't numbers, and if you want a number from a function that returns a string, you gotta use scanf and then index into the resulting array.
# Type expressions are now a thing! They match using the new behavior added to the =~ operator.
# Regexen don't match numbers, because numbers aren't strings.
# Selectors in cases are A-OK. Never do this.

# original:

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
  Integer: { notice('Type expression 40') }
  file('/Users/nick/Documents/manifests/myfile.txt').scanf("%i")[0]: { notice('from the file!') }
  '30': { notice ('thirty') }
  (20+20): {notice('expression forty')}
  #$varcase: { notice('variable forty') }
  /(20|40)/: { notice ("fourty ($1)") }
  $varsel ? { 30 => "nothing", 90 => 40,}: { notice('back-nested forty')}
  'true': {notice('haha, thats not a string!')}
  true: {notice('okay, true it is')}
  default: {notice ('lawl!')}
}

notice( "Anything left in the regex subpattern stack? $1")


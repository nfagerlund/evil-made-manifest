# Does include accept an array? ONLY IN >=3.0
# Does include flatten a nested array? ONLY IN >=3.0
class one { notify {'class one':}}
class two { notify {'class two':}}
class three { notify {'class three':}}
class four { notify {'class four':}}
# $myclasses = ['one', 'two', ['three', 'four']]
$myclasses = ['one', 'two', 'three', 'four']
 include $myclasses
# include one, two, three, four

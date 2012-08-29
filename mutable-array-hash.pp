
$myary = ['zero', 'one', 'two']
$myhash = {first => 'one', second => 'two', third => 'three'}

$myary[3] = 'three' #can insert new element
$myary[3] = 'something else' #can reassign
notice($myary[3])

$myhash[fourth] = 'four' #can insert new element
# $myhash[fourth] = 'something else' #can't reassign
notice($myhash[fourth])

$myary += ['four']
notice($myary[4])


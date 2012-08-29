# Testing whether arrays can be considered equal to one of their elements.
# THEY CAN'T, of course, but see collector-search.pp for how collectors fuck that up. 
$myarray = ['one', 'two', 'three']
notice( $myarray == 'one' )


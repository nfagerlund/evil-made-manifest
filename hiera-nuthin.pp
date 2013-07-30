# What happens when hiera finds nothing? 
# Oh, it blows up, same as with a param that finds nothing. OK. 
$myvar = hiera('barkf')
notice ($myvar)


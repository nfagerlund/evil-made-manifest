# What's the deal with CRLF newlines? 
# - You can't make explicit ones with escape sequences, because Puppet 2.7 doesn't recognize \r.
# - Whatever is saved in the file gets preserved, so if you save the file as CRLF, that's what the newlines will get stored in the catalog as. 
# so all told you're probably better off using templates or source files to ship files to windows hosts. 

$strang = 'first line

second line'

$strung = "First line\n\nsecond line"

notice($strang)
notice($strung)
notice($strang == $strung)

# $crlfer = 
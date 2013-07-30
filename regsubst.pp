# This was from when I was trying to write an mcollective module, and I needed to generate a regex I could pass to the file_line resource type. That meant escaping any dots, among other things, and I needed to make sure the escaping and substitution were working right.

$strang = 'plugin.redis.host'
$clean_strang = regsubst($strang, '\.', '\\.', 'G')
$myregex = "^ *${clean_strang} =.*"
notice $myregex

validate_re('plugin.redis.host = something_wrong', $myregex)
# validate_re('pluginxredisxhost = something_wrong', $myregex) # make sure it's catching literal dots and not the any-character wildcard

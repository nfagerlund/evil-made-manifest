# If you set nil to a hash key in a template, what does that translate to in the puppet DSL?
# An empty string.
$myhash = {}
$dumpvar = inline_template("
<% @myhash['firstkey'] = 'real value'; @myhash['secondkey'] = nil %>
")

notice(spew($myhash))
notice($myhash['secondkey'])

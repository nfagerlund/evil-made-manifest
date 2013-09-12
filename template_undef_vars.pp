$mytemplate = "
@myvar = <%= @myvar.inspect %>
lookupvar('myvar') = <%= scope.lookupvar('myvar').inspect %>
has_variable?('myvar') = <%= has_variable?('myvar') %>

@myabsentvar = <%= @myabsentvar.inspect %>
lookupvar('myabsentvar') = <%= scope.lookupvar('myabsentvar').inspect %>
has_variable?('myabsentvar') = <%= has_variable?('myabsentvar') %>
"

$myvar = undef
# $myabsentvar = undef

notice( inline_template($mytemplate) )

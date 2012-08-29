# This is for testing that issue with checking for variable existence, where has_variable? doesn't recognize explicitly undeffed variables as nil. 
# Results: It works the way it was documented as of Jun 7 2012, where if @var works fine and has_variable?('var') is kinda busted. 
$var1 = "something"
$template = "<% if @var1 %>defined once, <% end %><% if has_variable?('var1') %>defined twice, <% end %>value one = <%= @var1 %>."


notice( inline_template($template) )

class vartest($var2 = undef) {
  $template = "<%= @var2 ? 'TRUTHY' : 'FALSE' %>.  IS:<%= @var2 %>"
  notice(inline_template($template))
}

include vartest
class outside {
  #$outvar = "some value"
}
class inside {
  include outside
  $invar = $outside::outvar
  $template = "<% if @invar %>defined once, <% end %><% if has_variable?('invar') %>defined twice, <% end %>value = <%= @invar %>."
  notice( inline_template($template) )

}

include inside
# How about tags, is that variable parse-order dependent? 
# YES
# And the `tags` one does grab whatever applies to the current container.

notice(" outside a class")
notice( inline_template("<% tags.each do |klass| -%>The tag <%= klass %> is defined<% end -%>") )

class myclass {
  notice (" before a thing")
  notice( inline_template("<% tags.each do |klass| -%>The tag <%= klass %> is defined<% end -%>") )
  notice(" after a thing")
  tag funkytown
  notice( inline_template("<% tags.each do |klass| -%>The tag <%= klass %> is defined<% end -%>") )
}

include myclass

# oh hell w/ it let's use scope.to_hash too.
# cool looks like it uses their local names. 

notice( inline_template("    <% scope.to_hash.keys.each do |k| -%>
    <%= k %>
        <% end -%>") )


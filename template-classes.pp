# What's the deal with the classes variable? Is it parse-order dependent? Does it check defined classes or declared ones? 
# Yes it is. Declared ones. 
class thisclass {
  notify {'class is declared':}
}

notice( inline_template("<% classes.each do |klass| -%>The class <%= klass %> is defined<% end -%>") )

include thisclass

notice( inline_template("<% classes.each do |klass| -%>The class <%= klass %> is defined<% end -%>") )


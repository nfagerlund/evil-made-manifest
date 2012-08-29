# Checking if resource defaults are parse-order dependent.
# They're not! So although they obey scope, they are not variables.
notify {'something':}
Notify { message => "Set by default!" }


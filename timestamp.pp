# What's up with the hidden _timestamp fact?
# It's available in puppet agent / puppet master, but not in puppet apply.
notify {"Timestamp is $_timestamp":}

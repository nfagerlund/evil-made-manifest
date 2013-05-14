# Sorted facts for mcollective to reduce noise -- this works.

file {'/tmp/mcollective': ensure => directory}
file{"/tmp/mcollective/facts.yaml":
  ensure => file,
#   owner    => root,
#   group    => root,
#   mode     => 400,
#   loglevel => debug, # reduce noise in Puppet reports
  content  => inline_template('<% fact_lines = [] %><% scope.to_hash.reject { |k,v| k.to_s =~ /(uptime_seconds|timestamp|free|sp_uptime)/ }.each{|fact, value| fact_lines << %Q[  #{fact}: "#{value}"]} %><%= "---\n#{fact_lines.sort.join(%Q[\n])}\n" %>'), # exclude rapidly changing facts
}
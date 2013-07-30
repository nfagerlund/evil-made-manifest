#!/usr/bin/env ruby

output = <<EOT
---
environment: production
parameters:
classes: 
  testclass:
#     param1: "Value from an ENC!"
#     param3: "Another value from an ENC!"
EOT
puts output


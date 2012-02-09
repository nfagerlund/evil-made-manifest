# This demonstrates the @fact notation in templates. Wanted to see how far back it was available, and stopped looking at 0.25.0. good enough for me, eh.
# UNFORTUNATELY, that instance variable thing doesn't reliably refer to top-scope facts, as see below. 
class bunkclass {
  $fqdn = "something bogus"
  notice(inline_template("<%= @fqdn %>"))
}
include bunkclass

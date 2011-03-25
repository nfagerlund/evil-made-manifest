# http://projects.puppetlabs.com/issues/4473
# This is valid code and ends up posting both notifies. UGGHHHHHH. 

class foo::bar {
  notify {"foo::bar": }
}
class foo inherits bar {
  notify {"bar": }
}
include foo

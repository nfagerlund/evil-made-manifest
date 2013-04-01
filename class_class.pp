# So it turns out you can actually name a class class, contrary to what I thought I found when documenting the puppet language. You just need to be sure to quote the name when you include/declare it. 
class class {
  notify {'hey it worked':}
}

#include "class"
class {'class':}


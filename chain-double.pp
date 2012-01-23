# This is meant to prove that chaining works when you put arrows between resources
# as well as between resource references. Easiest way I could think of to prove this is to
# create a circular dependency. 
# Result: yup, works as expected!

notify {'one':} -> notify {'the other':}
Notify['the other'] -> Notify['one']


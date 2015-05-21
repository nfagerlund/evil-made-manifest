# (1, 2, 3).notice
# Error: Could not parse for environment production: Syntax error at ',' at /Users/nick/Documents/manifests/future_41_splat_chaining-pup-4398.pp:1:3 on node magpie.lan

([1, 2, 3]).notice
([1, 2, 3]).notice ;
# Notice: Scope(Class[main]): [1, 2, 3]
# *[1, 2, 3].notice
# Error: Evaluation Error: The value '[1, 2, 3]' cannot be converted to Numeric. at /Users/nick/Documents/manifests/future_41_splat_chaining-pup-4398.pp:4:10 on node magpie.lan
# Notice: Scope(Class[main]): [1, 2, 3]

(*[1, 2, 3]).notice
# Notice: Scope(Class[main]): [1, 2, 3] 1 2 3
# Notice: Scope(Class[main]): [1, 2, 3] 1 2 3
# ....WHAT
# OK, if i put a semicolon after the other one, I get:
# Notice: Scope(Class[main]): [1, 2, 3]
# Notice: Scope(Class[main]): 1 2 3
# ...so they were both eating the output of the other one as their extra arguments............. I think?

# So what about...

(*[4, 5, 6]).notice

# notify {"hi":}

(*[4, 5, 6]).notice

# Notice: Scope(Class[main]): [1, 2, 3] [1, 2, 3]
# Notice: Scope(Class[main]): [1, 2, 3] [1, 2, 3]
# Notice: Scope(Class[main]): 1 2 3 4 5 6
# Notice: Scope(Class[main]): 1 2 3 4 5 6 4 5 6
# Notice: Scope(Class[main]): 1 2 3 4 5 6 4 5 6

# Yeah, so the problem is that whitespace doesn't separate expressions, really. The parentheses before the next chain-call gets treated as additional arguments to the prior call. You can suppress this by putting an explicit () after each chain-call, or separating expressions with semicolons.

# I consider this syntax unadvisable anyway. See https://tickets.puppetlabs.com/browse/DOC-2002 for my reasoning. I'm not documenting this.

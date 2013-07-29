This document is so I can reverse-engineer github's header ID munging, which doesn't appear to be documented anywhere. It appears to happen as a post-processing step to the rendered HTML, since they use many different tools to render the various lightweight markups and the anchors have a consistency that should be impossible if you're relying on the upstream tools.

Hypotheses:

- All alphabetic chars are downcased (non-roman? unicode?)
- All spaces are replaced with hyphens
- All hyphens are left alone
- All underscores are left alone
- All remaining non-alphabetic non-numeric chars are deleted
- Dunno what happens with dupe headers
- Dunno what happens with dupe-but-for-non-alphanumeric-chars headers
- Embedded html headers without ID attributes should work the same
- Embedded html headers WITH ID attributes should also work the same, because it's not embedding an ID attribute, it's doing that anchor thing (see below). ID attributes should not be removed, though.

Observed behaviors:

- It doesn't embed IDs in the header tag; it adds an `<a name="..." class="anchor" href="..."></a>` element inside the header. (Note the weird old "name" attribute.)

### New `allow_ip` Directive in `auth.conf`; IP Addresses Disallowed in `allow` Directive

### XML-RPC support is entirely removed

Same exactly:

### XML-RPC support is entirely removed

### Puppet Apply's `--apply` Option Is Removed

### [Puppet 3 Reference Manual](/puppet/3/reference)

Same with extra non-alphanums at end:

### [Puppet 3 Reference Manual](/puppet/3/reference)&&

Same with extra non-alphanums in middle:

### [Puppet 3 Reference& &Manual](/puppet/3/reference)

### Non-Alphanums & with & spaces between

No alphabetic chars:

### 1234999

Same:

### 1234999

No alphanums:

### ^%&()!!!

Slightly different:

### ^%&()!!!--

Slightly different:

### ^%&()!!--!


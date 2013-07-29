This document is so I can reverse-engineer github's header ID munging, which doesn't appear to be documented anywhere. It appears to happen as a post-processing step to the rendered HTML, since they use many different tools to render the various lightweight markups and the anchors have a consistency that should be impossible if you're relying on the upstream tools.

Hypotheses:

- Not sure what happens with leading spaces.
- Not sure what happens w/ non-roman? unicode? capital leaders.

- Embedded html headers without ID attributes should work the same
- Embedded html headers WITH ID attributes should also work the same, because it's not embedding an ID attribute, it's doing that anchor thing (see below). ID attributes should not be removed, though.

Observed behaviors:

- It doesn't embed IDs in the header tag; it adds an `<a name="..." class="anchor" href="..."></a>` element inside the header. (Note the weird old "name" attribute.)
- All HTML tags are deleted, but the text inside any HTML element will remain.
- All uppercase alphabetic (roman, ASCII) chars are downcased
- Trailing spaces are deleted (in Markdown at least), but this is probably done by the underlying rendering library; not sure what would happen if a renderer left spaces.
- All remaining spaces are replaced with hyphens
    - Including multiple spaces in a row! They are not collapsed.
- All hyphens are left alone
- All underscores are left alone
- All remaining non-alphabetic non-numeric chars are deleted (inc. periods)
    - HTML entities (`&amp;`) are treated as though they were the character they represent.
- Duplicate headers are given a suffix of `-\d+`, i.e. a hyphen and one or more numbers.
    - The count starts with 1 on the second instance of the duplicate header; that is, the first instance has an implicit number of 0, though it isn't appended.
    - Duplication seems to be tested AFTER any other transformations: if removal of non-alphanumeric chars etc. would reduce two different strings to identical IDs, they are considered identical.
    - Haven't tested pushing the count beyond 9 yet.
- All-numeric headers are fine, and work as predicted by above behaviors. (This is a difference from Kramdown, which shits itself over them.)
- Headers with no alphanumeric characters, spaces, hyphens, or underscores will reduce to an empty ID (`name=""`), and clicking the link-to-here icon will take you to the top of the page, LOL.
    - Headers with a mix of allowed and disallowed alphanumeric chars work as predicted by above behaviors, inc. w/r/t dupes etc.



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

Multiple spaces:

### This     had five spaces

<h3>This is a raw HTML header inserted into the markdown</h3>

Dupe:

<h3>This is a raw HTML header inserted into the markdown</h3>

With ID element:

<h3 id="this-is-a-raw-html-header-inserted-into-the-markdown">This is a raw HTML header inserted into the markdown</h3>

Leading spaces in markdown:

###     This had five spaces at the front

Leading spaces in HTML:

<h3>      This had six spaces in the front.</h3>

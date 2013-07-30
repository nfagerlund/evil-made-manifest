This document is so I can reverse-engineer github's header ID munging, which doesn't appear to be documented anywhere. It appears to happen as a post-processing step to the rendered HTML, since they use many different tools to render the various lightweight markups and the anchors have a consistency that should be impossible if you're relying on the upstream tools.

Observed behaviors:
-----

- This is an HTML post-processor that is invoked AFTER the markup renderer has run. This means it should act the same regardless of markup choice. It may act slightly different with embedded raw HTML in markdown, due to the way text nodes get cleaned up by the markdown renderer. (See spaces, etc.; discrepancies here are what proved it to be a post-processor.)
- It doesn't embed IDs in the header tag; it adds an `<a name="..." class="anchor" href="..."></a>` element inside the header. (Note the weird old "name" attribute.)
- Any `id="..."` element pre-existing in a header is removed.
- All HTML tags are deleted, but the text inside any HTML element will remain.
- All uppercase alphabetic ASCII chars are downcased.
    - Non-ascii alphabetic characters (inc. Cyrillic, accented Latin, and I don't know what else) will count as alphabetic characters (i.e. they won't be deleted or replaced with hyphens), but they will NOT be downcased -- things like Ñ and Á will remain as literals in the final ID.
        - Wondering what the criteria they're using for identifying alphabetic chars is; is it based on Unicode definitions?
- All spaces are replaced with hyphens
    - Including multiple spaces in a row! They are not collapsed.
    - Leading and trailing spaces can be (and usually are) stripped by a given markup language's rendering library. If there are any spaces ANYWHERE in the resulting HTML, they are treated as normal spaces. This means trailing spaces in a literal `<h3>` will become hyphens.
- All hyphens are left alone
- All underscores are left alone
- All remaining non-alphanumeric chars are deleted (inc. periods)
    - HTML entities (`&amp;`) are treated as though they were the character they represent.
    - Things like `&nbsp;` are considered non-alphanumeric and non-space, and get deleted.
- Duplicate headers are given a suffix of `-\d+`, i.e. a hyphen and one or more numbers.
    - The count starts with 1 on the second instance of the duplicate header; that is, the first instance has an implicit number of 0, though it isn't appended.
    - Duplication seems to be tested AFTER any other transformations: if removal of non-alphanumeric chars etc. would reduce two different strings to identical IDs, they are considered identical.
    - The count can go into multiple digits, if you have more than 10 of the same header text.
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

Trailing spaces in HTML:

<h3>This had four spaces at the end:    </h3>

More than 9 of the same thing:

### thing
### thing
### thing
### thing
### thing
### thing
### thing
### thing
### thing
### thing
### thing
### thing

Non-ascii capital letters:

### Testing áÁ ŌenñÑîÎblah ŒẄÐȵ

Cyrillic:

### Авг Ишж фСРНн

An nbsp:

### This has&nbsp;an nbsp

A literal tab:

### This has	a literal hard tab

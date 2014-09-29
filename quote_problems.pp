# In 3.x parser, a double backslash in single quotes is always two backslashes. This is wrong because it should be the only way to get string that ends with a backslash (like a windows directory path). The problem is fixed in the future parser. See PUP-1814 for details.
notice('this has a double \\ backslash')
notice("this has a double \\ backslash")
notice('this ends with a backslash\\') # if the output ends with a double-backslash, there's no way to end a string with a single backslash, because:
# notice('this breaks completely\')
notice('this ends with a single quote\'')

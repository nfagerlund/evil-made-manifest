# In 3.5+, since puppet master can use a directory as the value of the manifest setting, does puppet apply get parity and accept a directory on the command line?

# YES!

notice('this one went first')
notify {'first file':}

$earliervar = "This is from the first file."

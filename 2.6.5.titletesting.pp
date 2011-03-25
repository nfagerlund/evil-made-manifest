# In http://projects.puppetlabs.com/issues/5259, a commenter says the following shouldn't work:

notify { ['testmessage one', 'testmessage two']: 
    message => "This is the ${name}.",
}
# 'magine that, it still doesn't even with the what'sit fixed for defines. 


# Does str2bool blow up on real bools? YES
# Does str2bool work with numbers? YES
# Do variables with bools turn into strings when you double-quote them? YES, and then they're fine for str2bool.
# what about arrays? They get compressed to strings. this works fine w/ e.g. ['1']. But it also works fine w/ e.g. ['tr', 'ue']! WACKY.
# I assume hashes are right out, but let's... ahahaha, {t => 'r', u => 'e'} totally works. 

$subj = {t => 'r', u => 'e'}

notice(str2bool("$subj"))


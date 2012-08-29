# Control variables
# Second test: Can you use an arbitrary expression in the control variable? NO.
# eleventh: Can you use a function call as the control var? YES

# Cases
# First test: can you do multiple cases in a selector by using commas? NO.
# third test: can you use a function call as a case? YES
# ninth test: Okay, can you nest the LEFT side of a selector? ok whew, NO

# Values
# fourth test: can you use a function call as a value? YES
# fifth test: can you use an arbitrary expression as a value? NO
# eighth test: can you nest a selector? HOLY SHIT, YES

# Locations
# sixth test: can you use a selector directly in a function call? YES
# seventh test: Can you use a selector as the title of a resource? HAHAHA WOW, YES
# tenth test: can you use a selector in an arbitrary expression? YES

$myvar = 80
$varcase = 40

$output = file('/Users/nick/Documents/manifests/myfile.txt') ? {
    '30' => 'thirty',
    #(20+20): {notice('expression fourty')}
    $varcase => 'it is itself, yay',
    #$myvar ? { 30 => 'nothing', 80 => '40', } => 'pre-nested fourty, wow',
    '40' => '100',
    default => 'lawl!',
  }
notice($output)


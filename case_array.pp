# How about using arrays in case statements?

$myary = [40, 30]

case $myary {
  [30, 40]: { notify {"it's backwards":} }
  [ 40, 30     ]: { notify {"it's forwards":} }
  Array: { notify {"it's an array.":} }
  default: { notify {"you are nothing":} }
}

# yeah it's fine
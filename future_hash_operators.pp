# Hash concatenation?

$myhash = {a => "first"}

$nexthash = $myhash + {b => "second"} + [c, 9]  # {a => first, b => second, c => 9}
$overwrittenhash = $nexthash + {c => 17}        # {a => first, b => second, c => 17}
$shrunkhash = $overwrittenhash - c              # {a => first, b => second}
$shrunk2 = $overwrittenhash - [c, a]            # {b => second}
$shrunk3 = $overwrittenhash - {c => 17, a => "something else"}  # {b => second} ....HUH.
$shrunk4 = $overwrittenhash - {a => a, d => d}  # {b => second, c => 17}

notice($nexthash)
notice($overwrittenhash)
notice($shrunkhash)
notice($shrunk2)
notice($shrunk3)
notice($shrunk4)

# Notice: Scope(Class[main]): {a => first, b => second, c => 9}
# Notice: Scope(Class[main]): {a => first, b => second, c => 17}
# Notice: Scope(Class[main]): {a => first, b => second}
# Notice: Scope(Class[main]): {b => second}
# Notice: Scope(Class[main]): {b => second}
# Notice: Scope(Class[main]): {b => second, c => 17}

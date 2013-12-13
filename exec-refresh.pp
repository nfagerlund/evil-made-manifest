# Okay, I think I've identified all the permutations:

# 1. Exec was going to run anyway. It receives any number of refresh events.
#   Fires twice.
# 2. Exec wasn't going to run (blocking condition WASN'T refreshonly). It receives any number of refresh events.
#   Does not fire.
# 3. Exec wasn't going to run (blocking condition WAS refreshonly). It receives any number of refresh events.
#   Fires once.
# 4. Like 1 (would run), but has refresh attribute.
#   Normal command fires once, then refresh command fires once.
# 5. Like 2 (conditions failed), but has refresh attribute.
#   Does not fire.
# 6. Like 3 (refreshonly), but has refresh attribute.
#   Refresh command fires once; normal command does not fire.
# 7. Like 2 + 3 (conditions failed, refreshonly)
#   Does not fire.
# 8. Like 5 + 6 (conditions failed, refreshonly, refresh)
#   Does not fire.
# 9. Like 1 but the exec has noop set.
#   Fires once, despite noop.
# 10. Like 4 but with noop
#   Fires the refresh command.
# 11. Would run twice (either normal + normal or normal + refresh), but blocking condition takes effect after first run
#   Only runs once (normal command)

exec {"/bin/echo 'regular' >> /tmp/output.txt":
  refresh => "/bin/echo 'refresh' >> /tmp/output.txt",
  logoutput => true,
#   creates => '/tmp/output.txt',
#   onlyif => "/usr/bin/false",
#   refreshonly => true,
#   noop => true,
}

exec {"true one":
  command => '/usr/bin/true',
  notify => Exec["/bin/echo 'regular' >> /tmp/output.txt"],
}

exec {"true two":
  command => '/usr/bin/true',
  notify => Exec["/bin/echo 'regular' >> /tmp/output.txt"],
}

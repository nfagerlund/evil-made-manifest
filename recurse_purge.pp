# is recurse => false still the default?
  # yes.
# Does recurse => true cause unmanaged files to be removed, if you don't set a source?
  # Only if 'purge => true' is also set.
# does recurse => true with a source cause unmanaged files to be removed?
  # Nope, it copies things into place but doesn't delete. This is true with recurse => remote, as well.
# How's the counting on recurselimit work? (leaving out purge for the time being.)
  # 0: copy nothing.
  # 1: Create subdirectories, but don't copy any files from them.
  # 2: Copy files inside the first level of subdirectories, including creating 2nd level subdirectories, but don't move any files into the sub-sub directories.
# Can any difference be determined between recurse => true and recurse => remote?
  # Without purge:
    # It looks the same! All files get copied in both cases.
    # What about with debug? Same.
  # With purge:
    # AH HA, here's the difference: recurse => remote makes purge impossible. But it does so silently, so you get no warning that it's not gonna purge.
    # But with recurselimit, it's weird. If your remote source has files in deep subdirectories and the recurselimit cuts off before them, then the equivalent files won't get copied over, but they WILL get left unpurged if purge is enabled and they're already present for some reason. And if they differ from the remote source, they won't get updated.
# How's recurselimit work when source isn't set?
  # As expected: it leaves files in lower subdirectories unmanaged.
  # How about with force?
    # Ooh, in that case it blows away occupied directories at the upper levels and the lower levels don't even exist anymore.

  file { '/tmp/foo':
    ensure => directory,
#    owner => root,
#    group => wheel,
    purge => true,
    recurse => true,
    recurselimit => 2,
    force => true,
#    source => 'puppet:///files/foo',
  }
#   file { '/tmp/foo/bar':
#     ensure => present,
# #    owner => root,
# #    group => wheel,
#     content => "myfile!",
#   }

file {'/tmp/thingy':
  ensure => file,
  mode => 0644,
}
# Oh good, it's a compilation error in puppet 4:
# Error: Parameter mode failed on File[/tmp/thingy]: The file mode specification must be a string, not 'Fixnum' at /Users/nick/Documents/manifests/future_file_mode.pp:1
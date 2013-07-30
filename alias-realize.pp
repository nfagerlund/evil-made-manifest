# Can you use aliases when realizing a resource? NO
# How about namevars? NO
# With a collector? YES, well ok then.

    @file {'file1':
      path => '/tmp/file1',
      ensure => file,
      alias => ['othername', 'fourthname'],
    }

# realize File['fourthname']
# realize File['/tmp/file1']
File <| alias == 'fourthname' |>
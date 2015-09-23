# This internal function translates the ipv(4|6)acls format into a resource
# suitable for create_resources. It is not intended to be used outside of the
# postgresql internal classes/defined resources.
#
# This function accepts an array of strings that are pg_hba.conf rules. It
# will return a hash that can be fed into create_resources to create multiple
# individual pg_hba_rule resources.
#
# The second parameter is an identifier that will be included in the namevar
# to provide uniqueness. It must be a string.
#
# The third parameter is an order offset, so you can start the order at an
# arbitrary starting point.
#
function postgresql::acls_to_resource_hash(Array $acls, String $id, Integer $offset) {

  $func_name = "postgresql::acls_to_resources_hash()"

  # The final hash is constructed as an array of individual hashes
  # (using the map function), the result of that
  # gets merged at the end (using reduce).
  #
  $resources = $acls.map |$index, $acl| {
    $parts = $acl.split('\s+')
    unless $parts =~ Array[Data, 4] {
      fail("${func_name}: acl line $index does not have enough parts")
    }

    # build each entry in the final hash
    $resource = { "postgresql class generated rule ${id} ${index}" =>
      # The first part is the same for all entries
      {
        'type'     => $parts[0],
        'database' => $parts[1],
        'user'     => $parts[2],
        'order'    => sprintf("'%03d'", $offset + $index)
      }
      # The rest depends on if first part is 'local',
      # the length of the parts, and the value in $parts[4].
      # Using a deep matching case expression is a good way
      # to untangle if-then-else spaghetti.
      #
      # The conditional part is merged with the common part
      # using '+' and the case expression results in a hash
      #
      +
      case [$parts[0], $parts, $parts[4]] {

        ['local', Array[Data, 5], default] : {
          { 'auth_method' => $parts[3],
            'auth_option' => $parts[4, -1].join(" ")
          }
        }

        ['local', default, default] : {
          { 'auth_method' => $parts[3] }
        }

        [default, Array[Data, 7], /^\d/] : {
          { 'address'     => "${parts[3]} ${parts[4]}",
            'auth_method' => $parts[5],
            'auth_option' => $parts[6, -1].join(" ")
          }
        }

        [default, default, /^\d/] : {
          { 'address'     => "${parts[3]} ${parts[4]}",
            'auth_method' => $parts[5]
          }
        }

        [default, Array[Data, 6], default] : {
          { 'address'     => $parts[3],
            'auth_method' => $parts[4],
            'auth_option' => $parts[5, -1].join(" ")
          }
        }

        [default, default, default] : {
          { 'address'     => $parts[3],
            'auth_method' => $parts[4]
          }
        }
      }
    }
    $resource
  }
  # Merge the individual resource hashes into one
  #
  $resources.reduce({}) |$result, $resource| { $result + $resource }
}


# These are the tests listed here: https://github.com/puppetlabs/puppetlabs-postgresql/blob/master/spec/unit/functions/postgresql_acls_to_resources_hash_spec.rb
notice( postgresql::acls_to_resource_hash(['local   all             postgres                                ident'], 'test', 100) )
notice( postgresql::acls_to_resource_hash(['local   all             root                                    ident'], 'test', 100) )
notice( postgresql::acls_to_resource_hash(['local   all             all                                     ident'], 'test', 100) )
notice( postgresql::acls_to_resource_hash(['host    all             all             127.0.0.1/32            md5'], 'test', 100) )
notice( postgresql::acls_to_resource_hash(['host    all             all             0.0.0.0/0            md5'], 'test', 100) )
notice( postgresql::acls_to_resource_hash(['host    all             all             ::1/128                 md5'], 'test', 100) )
notice( postgresql::acls_to_resource_hash(['host    all             all             1.1.1.1 255.255.255.0    md5'], 'test', 100) )
notice( postgresql::acls_to_resource_hash(['host    all             all             1.1.1.1 255.255.255.0   ldap ldapserver=ldap.example.net ldapprefix="cn=" ldapsuffix=", dc=example, dc=net"'], 'test', 100) )
notice( postgresql::acls_to_resource_hash([], 'test', 100) )


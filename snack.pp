#/etc/puppetlabs/puppet/modules/snicker/snack.pp
 
class snicker::snack {
  jabberwock { 'gimble':
    chortle => true,
    brillig => 'frabjous',
    birds   => ['jubjub', 'vorpal', "${wabe}"],
  }
  galumphing { ['mome', 'rath']:
    borogove => 'bandersnatch',
    tulgey   => $uffish,
    mimsy    => 'manxome',
  }
}

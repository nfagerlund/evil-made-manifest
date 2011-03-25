file {'/tmp/skellington': 
    ensure => present,
    content => file('/Users/nick/Documents/puppet-docs/source/skeleton-index.markdown'),
    mode => 600,
}


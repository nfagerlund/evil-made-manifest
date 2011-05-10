    $apache = $operatingsystem ? {
      /(?i)(centos|redhat)/                => "httpd-$1",
      redhat                => 'httpd',
      /(?i)(ubuntu|debian)/ => 'apache2',
    }
notice ($apache)


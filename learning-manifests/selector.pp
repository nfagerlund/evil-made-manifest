$apache = $operatingsystem ? {
  /(?i)^cent/ => 'httpd',
  redhat => 'httpd',
  debian => 'apache2',
  default => undef,
}
notice ($apache)

notice ($is_virtual ? {
  'true' => "some string",
  'false' => "other string",
})


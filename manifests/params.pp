class kafka::params {
  $datastore            = hiera('kafka:datastore', '/var/kafka')
  $package_dir          = hiera('kafka:package_dir', '/var/lib/kafka')
  $package_url          = hiera('kafka:package_url', undef)
  $install_dir          = hiera('kafka:install_dir', '/usr/local/kafka')
  $hostname             = hiera('kafka:hostname', $::ipaddress)
  $log_retention_hours  = hiera('kafka:log_retention_hours', '168')
  $statsd_host          = hiera('kafka:statsd_host', $::statsd_host)
  $statsd_port          = hiera('kafka:statsd_port', $::statsd_port)
  $statsd_exclude_regex = hiera('kafka:statsd_exclude_regex', $::statsd_exclude_regex)
  $zookeeper_connect    = hiera('kafka:zookeeper_connect', 'localhost:2181')
}

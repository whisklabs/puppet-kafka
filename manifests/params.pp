class kafka::params {

  $datastore   = hiera('kafka:datastore', '/var/kafka')
  $package_dir = hiera('kafka:package_dir', '/var/lib/kafka')
  $package_url = hiera('kafka:package_url', undef)
  $install_dir = hiera('kafka:install_dir', '/usr/local/kafka')
  $hostname    = hiera('kafka:hostname', $::ipaddress)
  $statsd_host = hiera('kafka:statsd_host', $::statsd_host)
  $statsd_port = hiera('kafka:statsd_port', $::statsd_port)
  $zookeeper_connect = hiera('kafka:zookeeper_connect', 'localhost:2181')
}

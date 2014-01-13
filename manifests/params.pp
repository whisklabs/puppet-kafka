class kafka::params {

  $datastore   = hiera('kafka:datastore', '/var/kafka')
  $package_dir = hiera('kafka:package_dir', '/var/lib/kafka')
  $package_url = hiera('kafka:package_url', undef)
  $install_dir = hiera('kafka:install_dir', '/usr/local/kafka')
  $hostname    = hiera('kafka:hostname', $::ipaddress)
  $zookeeper_connect = hiera('kafka:zookeeper_connect', 'localhost:2181')
}
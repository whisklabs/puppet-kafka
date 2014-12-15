class kafka (
  $broker_id,
  $hostname = $kafka::params::hostname,
  $zookeeper_connect = $kafka::params::zookeeper_connect,
  $package_dir = $kafka::params::package_dir,
  $package_url = $kafka::params::package_url,
  $install_dir = $kafka::params::install_dir,
  $statsd_host = $kafka::params::statsd_host,
  $statsd_port = $kafka::params::statsd_port,
  $statsd_port = $kafka::params::statsd_exclude_regex ) inherits kafka::params {

  require java
  
  anchor { 'kafka::begin': } ->
  class { '::kafka::package': } ->
  class { '::kafka::install': } ->
  class { '::kafka::config': } ~>
  class { '::kafka::service': } ->
  anchor { 'kafka::end': }

}

class kafka (
  $broker_id,
  $hostname = $kafka::params::hostname,
  $zookeeper_connect = $kafka::params::zookeeper_connect,
  $package_dir = $kafka::params::package_dir,
  $package_url = $kafka::params::package_url,
  $install_dir = $kafka::params::install_dir ) inherits kafka::params {

  require java
  
  anchor { 'kafka::begin': } ->
  class { '::kafka::package': } ->
  class { '::kafka::install': } ->
  class { '::kafka::config': } ~>
  class { '::kafka::service': } ->
  anchor { 'kafka::end': }

}
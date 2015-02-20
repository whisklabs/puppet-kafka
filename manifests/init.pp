class kafka (
  $broker_id,
  $hostname = $kafka::params::hostname,
  $zookeeper_connect = $kafka::params::zookeeper_connect,
  $package_dir = $kafka::params::package_dir,
  $package_url = $kafka::params::package_url,
  $install_dir = $kafka::params::install_dir,
  $logs_dir = $kafka::params::logs_dir,
  $log_retention_hours = $kafka::params::log_retention_hours,
  $statsd_host = $kafka::params::statsd_host,
  $statsd_port = $kafka::params::statsd_port,
  $statsd_enabled = $kafka::params::statsd_enabled,
  $statsd_exclude_regex = $kafka::params::statsd_exclude_regex,
  $delete_topic_enabled = $kafka::params::delete_topic_enabled) inherits kafka::params {

  require java

  anchor { 'kafka::begin': } ->
  class { '::kafka::package': } ->
  class { '::kafka::install': } ->
  class { '::kafka::config': } ~>
  class { '::kafka::service': } ->
  anchor { 'kafka::end': }

}

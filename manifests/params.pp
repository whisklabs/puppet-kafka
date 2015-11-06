class kafka::params {
  $datastore                = hiera('kafka:datastore', '/var/kafka')
  $package_dir              = hiera('kafka:package_dir', '/var/lib/kafka')
  $package_url              = hiera('kafka:package_url', undef)
  $install_dir              = hiera('kafka:install_dir', '/usr/local/kafka')
  $logs_dir                 = hiera('kafka:logs_dir', '/var/log/kafka')
  $hostname                 = hiera('kafka:hostname', $::ipaddress)
  $datalog_dir              = hiera('kafka:datalog_dir', '/tmp/kafka-logs')
  $log_retention_hours      = hiera('kafka:log_retention_hours', '168')
  $log_retention_minutes    = hiera('kafka:log_retention_minutes', undef)
  $message_max_bytes        = hiera('kafka:message_max_bytes', '1000000')
  $replica_fetch_max_bytes  = hiera('kafka:replica_fetch_max_bytes', '1048576')
  $fetch_message_max_bytes  = hiera('kafka:fetch_message_max_bytes', '1048576')
  $statsd_host              = hiera('kafka:statsd_host', $::statsd_host)
  $statsd_port              = hiera('kafka:statsd_port', $::statsd_port)
  $statsd_enabled           = hiera('kafka:statsd_enabled', $::statsd_enabled)
  $statsd_exclude_regex     = hiera(
    'kafka:statsd_exclude_regex',
    $::statsd_exclude_regex
  )
  $zookeeper_connect        = hiera('kafka:zookeeper_connect', 'localhost:2181')
  $delete_topic_enabled     = hiera('kafka:delete_topic_enabled', false)
}

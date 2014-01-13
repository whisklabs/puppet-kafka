class kafka::service inherits kafka {

  service { 'kafka':
    ensure => running,
    provider => 'upstart',
    require => File['kafka-init'],
  }
}
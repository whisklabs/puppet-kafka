class kafka::config inherits kafka {

  $conf_file = "${install_dir}/kafka/config/server.properties"

  file { $conf_file:
    owner => 'kafka',
    group => 'kafka',
    mode => "644",
    alias => "kafka-cfg",
    require => File["kafka-app-dir"],
    content => template("kafka/config/server.properties.erb"),
  }

  $logsconf_file = "${install_dir}/kafka/config/log4j.properties"

  file { $logsconf_file:
    owner => 'kafka',
    group => 'kafka',
    mode => "644",
    alias => "kafka-logcfg",
    require => File["kafka-app-dir", "kafka-logs-dir"],
    content => template("kafka/config/log4j.properties.erb"),
  }

  file { $kafka::params::logs_dir:
    ensure => directory,
    owner  => 'kafka',
    group  => 'kafka',
    mode   => "755",
    alias  => "kafka-logs-dir",
  }

  file { '/etc/init/kafka.conf':
    content => template("kafka/init/kafka.conf.erb"),
    mode => "0644",
    alias => 'kafka-init',
    require => File[$conf_file],
  }
}

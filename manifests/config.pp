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
  
  file { '/etc/init/kafka.conf':
    content => template("kafka/init/kafka.conf.erb"),
    mode => "0644",
    alias => 'kafka-init',
    require => File[$conf_file],
  }
}
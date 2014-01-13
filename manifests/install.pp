class kafka::install inherits kafka {
  
  group { 'kafka':
    ensure => present,
    gid => "801"
  }

  user { 'kafka':
    ensure => present,
    comment => "Kafka",
    password => "!!",
    uid => "801",
    gid => "801",
    shell => "/bin/bash",
    require => Group['kafka'],
  }

  file { $install_dir:
    ensure => 'directory',
    owner => 'kafka',
    group => 'kafka'
  }
  
  exec { "untar ${kafka::package::basefilename}":
    command => "tar xfvz ${package_dir}/${kafka::package::basefilename} -C $install_dir",
    creates => "${install_dir}/${kafka::package::basename}/config",
    alias => "untar-kafka",
    require => File["${package_dir}/${kafka::package::basefilename}"],
    user => 'kafka',
    path    => ["/bin", "/usr/bin", "/usr/sbin"],
  }
  
  file { "${install_dir}/${kafka::package::basename}":
    ensure => "directory",
    mode => 0644,
    owner => "kafka",
    group => "kafka",
    alias => "kafka-app-dir",
    require => Exec["untar-kafka"],
  }
  
  file { "${install_dir}/kafka":
    force => true,
    ensure => "${install_dir}/${kafka::package::basename}",
    alias => "kafka-symlink",
    owner => "kafka",
    group => "kafka",
    require => File["kafka-app-dir"]
  }
}
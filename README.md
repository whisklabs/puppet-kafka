#puppet-kafka

A puppet module for [Apache Kafka](http://kafka.apache.org/) setup.

## Basic Usage

    node 'kafka-0' {
        include java

        class { 'kafka':
          broker_id => '0',
          hostname => $::ipaddress_eth1, # $::ipaddress is picked by default
          zookeeper_connect => 'localhost:2181',
          package_url => 'http://mirrors.ukfast.co.uk/sites/ftp.apache.org/kafka/0.8.0/kafka_2.8.0-0.8.0.tar.gz'
        }
    }

## Parameters

   - `broker_id` - cluster-unique Kafka broker id
   - `hostname` - the hostname to bind. expected to be available for other brokers and clients
   - `zookeeper_connect` - zookeeper connection string
   - `package_url` - might use http, ftp, puppet or file scheme
   
### Source Code

[Whisklabs Github repo](http://github.com/whisklabs/puppet-kafka)

#puppet-kafka

A puppet module for [Apache Kafka](http://kafka.apache.org/) setup.

## Basic Usage

    node 'kafka-0' {
        include java

        class { 'kafka':
          broker_id => '0',
          hostname => $::ipaddress_eth1, # $::ipaddress is picked by default
          zookeeper_connect => 'localhost:2181',
          package_url => 'http://mirror.symnds.com/software/Apache/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz'
        }
    }

## Parameters

   - `broker_id` - cluster-unique Kafka broker id
   - `hostname` - the hostname to bind. expected to be available for other brokers and clients
   - `zookeeper_connect` - zookeeper connection string
   - `package_url` - might use http, ftp, puppet or file scheme
   - `logs_dir` - the path where kafka should store its logs. By default /var/log/kafka/
   - `datalog_dir` - the path where kafka should store data. By default /tmp/kafka-logs
   - `statsd_host` - the statsd hostname
   - `statsd_port` - the statsd port
   - `statsd_exclude_regex` - the statsd exclude.regex eg. (?!(AllTopicsBytesInPerSec|AllTopicsBytesOutPerSec|AllTopicsMessagesInPerSec|AllTopicsFailedProduceRequestsPerSec)).+
   
### Source Code

[Whisklabs Github repo](http://github.com/whisklabs/puppet-kafka)

class kafka::package inherits kafka {

  if ($package_url != undef) {

    exec { 'create-kafka-packagedir':
      cwd     => '/',
      path    => ['/usr/bin', '/bin'],
      command => "mkdir -p ${package_dir}",
      creates => $package_dir;
    }

    file { $package_dir:
      ensure  => 'directory',
      require => Exec['create-kafka-packagedir'],
    }

    $filenameArray = split($package_url, '/')
    $basefilename = $filenameArray[-1]
    $basename = regsubst($basefilename, '(.+)\.tar\.gz$', '\1')

    $sourceArray = split($package_url, ':')
    $protocol_type = $sourceArray[0]

    case $protocol_type {

      puppet: {

        file { "${package_dir}/${basefilename}":
          ensure  => present,
          source  => $package_url,
          require => File[$package_dir],
          backup  => false,
        }

      }

      ftp, https, http: {

          exec { 'download-kafka-package':
            command => "wget -O ${package_dir}/${basefilename} $package_url 2> /dev/null",
            path    => ['/usr/bin', '/bin'],
            creates => "${package_dir}/${basefilename}",
            require => File[$package_dir]
          }
          
          file { "${package_dir}/${basefilename}":
            ensure => present
          }

        }
      file: {

        $source_path = $sourceArray[1]
        file { "${package_dir}/${basefilename}":
          ensure  => present,
          source  => $source_path,
          require => File[$package_dir],
          backup  => false
        }

      }

      default: {
        fail("Protocol must be puppet, file, http, https, or ftp. You have given \"${protocol_type}\"")
      }
   }

  } else {
    fail("package url should be provided")
  }

}

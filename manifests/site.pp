package {'java-1.7':
  ensure  => present,
  name => 'java-1.7.0-openjdk-devel'
}

package {'git':
  ensure => present,
}


include jenkins

include go-server
include go-agent

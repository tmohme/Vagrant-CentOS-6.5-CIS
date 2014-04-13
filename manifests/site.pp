package {'java-1.7':
  ensure  => present,
  name => 'java-1.7.0-openjdk-devel'
}

package {'git':
  ensure => present,
}


include jenkins

include go-server

package {'go-agent':
  ensure => present,
  provider => rpm,
  source => 'http://download01.thoughtworks.com/go/13.4.1/ga/go-agent-13.4.1-18342.noarch.rpm',
}

service {'go-agent':
  ensure  => running,
  enable  => true,
  require => Package['go-agent'],
}


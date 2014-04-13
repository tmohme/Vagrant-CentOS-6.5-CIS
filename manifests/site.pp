package {'java-1.7':
  ensure  => installed,
  name => 'java-1.7.0-openjdk-devel'
}

package {'git':
  ensure => installed,
}

#package {'gradle':
#  ensure  => installed,
#  require => Package['java-1.7.0-openjdk'],
#}

include jenkins


package {'go-agent':
  ensure => installed,
  provider => rpm,
  source => 'http://download01.thoughtworks.com/go/13.4.1/ga/go-agent-13.4.1-18342.noarch.rpm',
}

service {'go-agent':
  ensure  => running,
  enable  => true,
  require => Package['go-agent'],
}


package {'go-server':
  ensure => installed,
  provider => rpm,
  source => 'http://download01.thoughtworks.com/go/13.4.1/ga/go-server-13.4.1-18342.noarch.rpm',
}

service {'go-server':
  ensure  => running,
  enable  => true,
  require => Package['go-server'],
}


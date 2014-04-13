class go-server {

  package {'go-server':
    ensure => present,
    provider => rpm,
    source => 'http://download01.thoughtworks.com/go/13.4.1/ga/go-server-13.4.1-18342.noarch.rpm',
  }

  service {'go-server':
    ensure  => running,
    enable  => true,
    require => Package['go-server'],
  }
  
  user {'go':
    ensure  => present,
    home    => '/var/go',
    require => Package['go-server'],
  }

  file {'/etc/go':
    ensure  => directory,
    source  => 'puppet:///modules/go-server/etc/go',
    recurse => true,
    owner   => 'go',
    group   => 'go',
    require => User['go'],
    notify  => Service['go-server'],
  }
}
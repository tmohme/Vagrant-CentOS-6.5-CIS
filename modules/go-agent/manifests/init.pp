class go-agent {

  package {'go-agent':
    ensure => present,
    provider => rpm,
    source => 'http://download01.thoughtworks.com/go/13.4.1/ga/go-agent-13.4.1-18342.noarch.rpm',
    require => Package['go-server'],
  }

  service {'go-agent':
    ensure  => running,
    enable  => true,
    require => [Package['java-1.7', 'go-agent'],
                Service['go-server'],
                File['/etc/default/go-agent'],
                ],
  }

  file {'/etc/default/go-agent':
    ensure  => file,
    source  => 'puppet:///modules/go-agent/etc/default/go-agent',
    owner   => 'go',
    group   => 'go',
    require => User['go'],
    notify  => Service['go-agent'],
  }
}
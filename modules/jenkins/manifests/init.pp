class jenkins {
  package {'jenkins':
    ensure  => present,
  }

  service {'jenkins':
    ensure  => running,
    enable  => true,
    require => Package['jenkins', 'git'],
  }
  
  user {'jenkins':
    ensure  => present,
    home    => '/var/lib/jenkins',
    require => Package['jenkins'],
  }

  file {'/etc/default/jenkins':
  ensure  => file,
  source  => 'puppet:///modules/jenkins/default/jenkins',
  require => Package['jenkins']
  }
  
  file {'/var/lib/jenkins':
    ensure  => directory,
    source  => 'puppet:///modules/jenkins/config',
    recurse => true,
    owner   => 'jenkins',
    group   => 'jenkins',
    require => User['jenkins'],
    notify  => Service['jenkins'],
  }
}
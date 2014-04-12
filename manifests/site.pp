package {'java-1.7.0-openjdk':
  ensure  => installed,
}

package {'git':
  ensure => installed,
}

#package {'gradle':
#  ensure  => installed,
#  require => Package['java-1.7.0-openjdk'],
#}

include jenkins

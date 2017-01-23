# Manage sshd config
class profile::ssh {
  package { 'openssh-server': ensure => installed }

  file { '/etc/ssh/sshd_config':
    content => epp('profile/ssh/sshd_config.epp', {
      'allow_users' => hiera('allow_users'),
    }),
    notify  => Service['ssh'],
  }

  service { 'ssh':
    ensure => running,
    enable => true,
  }
}
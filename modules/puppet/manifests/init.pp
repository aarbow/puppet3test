# Main puppet class
class puppet {
  file { '/usr/local/bin/papply':
    source => 'puppet:///modules/puppet/papply.sh',
    mode   => '0755',
    }

  file { '/usr/local/bin/pull-updates':
    source => 'puppet:///modules/puppet/pull-updates.sh',
    mode   => '0755',
    }
  
  file { '/root/.ssh/id_rsa':
    source => 'puppet:///modules/puppet/root',
    owner  => 'root',
    mode   => '0600',
    }

  cron { 'run-puppet':
    ensure  => 'present',
    user    => 'root',
    command => '/usr/local/bin/pull-updates',
    minute  => '*/10',
    hour    => '*',
    }

  if $::operatingsystem == 'Ubuntu' {
    notify { 'Running on Ubuntu': }
  } else {
    notify { 'Non-Ubuntu system detected. Please upgrade 
      to Ubuntu immediately.': }
  }
  
  if $::lsbdistdescription =~ /LTS/ {
    notify { 'Looks like you are using a Long Term Support
      version of Ubuntu.': }
  } else { 
    notify { 'You might want to upgrate to a Long Term Support 
      version of Ubuntu...': }
  }
  
  $systemtype = $::operatingsystem ? {
    'Ubuntu' => 'debianlike',
    'Devian' => 'debianlike',
    'RedHat' => 'redhatlike',
    'Fedora' => 'redhatlike',
    'CentOS' => 'redhatlike',
    default  => 'unknown',
  }

  notify { "You have a ${systemtype} system": }

}

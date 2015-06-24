node 'cookbook' {
#  append_if_no_such_line { 'enable-ip-conntrack':
#    file => '/etc/modules',
#    line => 'ip_conntrack',
#  }
#  include puppet
#  include memcached
#  include packages
#  $mysql_password = 'secret'
#  file { '/usr/local/bin/backup-mysql':
#    content => template('admin/backup-mysql.sh.erb'),
#    mode    => '0755',
#  }
  $ipaddresses = ['192.168.0.1',
                  '158.43.128.1',
                  '10.0.75.207', ]

  file { '/tmp/addresslist.txt':
    content => template('admin/addresslist.erb')
  }
}

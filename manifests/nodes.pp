node 'cookbook' {
  include puppet
  include memcached
  include packages
}

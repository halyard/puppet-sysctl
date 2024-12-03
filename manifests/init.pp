# @summary Configure sysctl settings
#
class sysctl () {
  file { '/etc/sysctl.d':
    ensure    => directory,
    owner     => 'root',
    group     => 'root',
    mode      => '0755',
    recurse   => true,
    purge     => true,
  }

  Sysctl::Setting <| |>

  ~> service { 'systemd-sysctl':
    ensure => running,
    enable => true,
  }
}

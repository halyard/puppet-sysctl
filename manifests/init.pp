# == Class: sysctl
#
# Configure sysctl values on a Mac
#
class sysctl (
) {
  $hiera_values = hiera_hash('::sysctl:entries', {})

  file { '/etc/sysctl.conf':
    ensure => file,
    owner  => 'root',
    group  => 'wheel',
    mode   => '0644'
  }

  create_resources(sysctl::entry, $hiera_values)
}

# == Class: sysctl::entry
#
# Set a single value
#
define sysctl::entry(
  $value,
  $ensure = 'present'
) {
  require sysctl

  file_line { "Set sysctl::value::${name} to ${value}":
    ensure            => $ensure,
    path              => '/etc/sysctl.conf',
    line              => "${name}=${value}",
    match             => "^${name}=.*$",
    match_for_absence => true
  }

  if $ensure == 'present' {
    exec { "Live-update sysctl::value::${name} to ${value}":
      command => "sysctl '${name}=${value}'",
      unless  => "sysctl -n '${name}' | grep '^${value}$'",
      user    => 'root'
    }
  }
}

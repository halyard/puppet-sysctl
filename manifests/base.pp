# Class: sysctl::base
#
# Common part for the sysctl definition. Not meant to be used on its own.
#
class sysctl::base (
  $purge              = false,
  $values             = undef,
  $sysctl_dir_path    = '/etc/sysctl.d',
  $sysctl_dir_owner   = 'root',
  $sysctl_dir_group   = 'wheel',
  $sysctl_dir_mode    = '0755'
) {

  if $values != undef {
    create_resources(sysctl, $values)
  }

  if $purge {
    $recurse = true
  } else {
    $recurse = false
  }
  file { $sysctl_dir_path:
    ensure  => directory,
    owner   => $sysctl_dir_owner,
    group   => $sysctl_dir_group,
    mode    => $sysctl_dir_mode,
    # Magic hidden here
    purge   => $purge,
    recurse => $recurse,
  }
}

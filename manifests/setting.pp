# @summary Create a sysctl setting
#
# @param key sets the sysctl setting name
# @param value sets the desired value
define sysctl::setting (
  String $value
  String $name = $title,
) {
  include sysctl

  file { "/etc/sysctl.d/${name}":
    ensure  => file,
    content => "${name}=${value}",
  }
}

# @summary Create a sysctl setting
#
# @param value sets the desired value
# @param key sets the sysctl setting name
define sysctl::setting (
  String $value,
  String $key = $title,
) {
  include sysctl

  file { "/etc/sysctl.d/${key}.conf":
    ensure  => file,
    content => "${key}=${value}",
  }
}

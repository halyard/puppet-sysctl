puppet-sysctl
==============

[![Puppet Forge](https://img.shields.io/puppetforge/v/halyard/sysctl.svg)](https://forge.puppetlabs.com/halyard/sysctl)
[![MIT Licensed](http://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)
[![Build Status](https://img.shields.io/travis/com/halyard/puppet-sysctl.svg)](https://travis-ci.com/halyard/puppet-sysctl)

Configure sysctl settings on Mac (which does not support /etc/sysctl.d)

## Usage

To set a value:

```
sysctl::entry { 'net.inet6.ip6.use_tempaddr':
  value => 0
}
```

This updates /etc/sysctl.conf as well as setting the running config value.

### Hiera

You can set a hash in hiera that will be automatically loaded when you require sysctl:

```
sysctl::values:
  net.inet6.ip6.use_tempaddr:
    value: 0
  net.some.other.key:
    value: 60
```

## License

puppet-sysctl is released under the MIT License. See the bundled LICENSE file for details.


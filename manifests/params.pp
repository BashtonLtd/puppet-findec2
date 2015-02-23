# == Class findec2::params
#
# This class is meant to be called from findec2
# It sets variables according to platform
#
class findec2::params (
  $package_ensure = 'present'
) {

  case $::osfamily {
    'RedHat', 'Amazon': {
      $package_name = 'find-ec2'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

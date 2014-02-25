# == Class findec2::install
#
class findec2::install {
  include findec2::params

  package { $findec2::params::package_name:
    ensure => present,
  }
}

# == Class: findec2
#
# Installs package for find-ec2
#
class findec2 inherits findec2::params {

  class { 'findec2::install': } ->
  Class['findec2']
}

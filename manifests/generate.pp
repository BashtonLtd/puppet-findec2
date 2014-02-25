# Generate a file using the find-ec2 utility
define findec2::generate (
  $template,
  $output,
  $frequency = 5,
  $tagname   = 'machinetype',
  $tagvalue  = 'web',
  $ownweight = '99999',
  $dummy     = false,
  $service   = undef ) {


  include findec2

  $cmd_start = "/usr/bin/find-ec2 --tagname ${tagname} --tagvalue ${tagvalue} --ownazweight ${ownweight}"
  if ($dummy) { $cmd_middle = "${cmd_start} --dummy" }
  else { $cmd_middle = $cmd_start }

  if ($service) { $cmd_final = "${cmd_middle} --notify ${service} ${template} ${output}" }
  else { $cmd_final = "${cmd_middle} ${template} ${output}" }

  cron { $name:
    command => $cmd_final,
    user    => root,
    minute  => "*/${frequency}",
  }
}

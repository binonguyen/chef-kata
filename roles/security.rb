name "security"
description "An example Chef role"
run_list "recipe[os-hardening]"
override_attributes({
  "os-hardening" => { "auth" => {"uid_min" =>  "1111"}}
})

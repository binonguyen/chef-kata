name "security"
description "first chef role"
run_list "recipe[os-hardening]"
override_attributes({
  "os-hardening" => {"auth" => {"uid_min" => "9999"}}
})

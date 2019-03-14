name "security"
description "chef-rold"
run_list "os-hardening"
override_attributes({
  "os-hardening" => { "auth" => { "uid_min" => "9999"}}
  })

name "security"
description "kata-role"
run_list "recipe[os-hardening]"
override_attributes({
    "os-harding" => {"auth" => {"uid_min" => "5555"}}
})
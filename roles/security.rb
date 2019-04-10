name "security"
description "chef"
run_list "recipe[os-hardening]"
override_attributes({
    "os-hardening" => { "auth" => {"uid_min" => "1234"}}
})
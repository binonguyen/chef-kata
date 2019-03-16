name "security"
description "kata-role"
run_list "recipe[os-hardening]"
name 'dev01-24'
override_attributes({
    "os-hardening" => {"auth" => {"uid_min" => "9876"}}
})
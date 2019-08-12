name "security"
description "Chef-kata security"
run_list 'recipe[os-hardening]'

override_attributes({
    "os-hardening" => {"auth" => {"gid_max" => "6789"}}
})
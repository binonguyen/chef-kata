name "dev"
description "for dev"
cookbook_versions({
    "chef-training" => "= 3.0.0",
    "os-hardening" => "= 3.2.1"
})
default_attributes "builder" => "Development"
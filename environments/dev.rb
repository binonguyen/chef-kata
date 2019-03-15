name "dev"
description "for DEV"
cookbook_versions({
    "chef-training" => "= 2.0.0",
    "os-hardening" => "= 3.2.1"
})
default_attributes "builder" => "Development"
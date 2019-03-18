name "dev"
description "for dev"
cookbook_versions({
    "chef-traning" => "= 2.0.0",
    "os-hardening" => "= 3.2.1"
})
default_attributes "builder" => "Development"
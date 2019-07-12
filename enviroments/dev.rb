name "dev"
description "for Development"
cookbook_versions({
    "chef-training" => "~> 0.1.1"
    "os-hardening" => "~> 1.4.1"
})
default_attributes({
    "chef-training" => {"my-name" => "Development"}
})
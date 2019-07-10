name "dev"
description "Development environments"
cookbook_versions({
    "chef-training" => "> 2.0.0",
    "os-hardening" =>  "= 1.4.1"
})
default_attributes({
    "chef-training" => {"my-name" => "Development"}
})
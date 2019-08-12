name "dev"
description "For Development"
cookbook_versions({
    "chef-training" => "=> 0.2.0",
    "os-hardening" => "= 3.2.1"
})

default_attributes({
    "chef-training" => {"yourName" => "Developers"}
})
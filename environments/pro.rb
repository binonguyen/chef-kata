name "pro"
description "Production environments"
cookbook_versions({
    "chef-training" => "= 2.0.0"
})
default_attributes({
    "chef-training" => {"my-name" => "Production"}
})
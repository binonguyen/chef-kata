name "pro"
description "for Production"
cookbook_versions({
    "chef-training" => "= 0.1.1"
})
default_attributes({
    "chef-training" => {"my-name" => "Production"}
})
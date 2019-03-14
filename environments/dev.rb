# name "dev"
# description "for dev"
# cookbook_versions({
#     "chef-training" => "= 1.0.0",
#     "os-hardening" => "= 3.2.1"
# })
# default_attributes 'builder' => "Development"
name "dev"
description "for dev"
cookbook_versions({
    "chef-training" => "= 1.0.0",
    "os-hardening" => "= 3.2.1"
})
default_attributes 'builder' => 'Development'

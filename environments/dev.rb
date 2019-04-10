name "dev"
description "for Develop"
cookbook_versions(
    "chef-training" => "= 0.1.0",
    "os-hardening" => "3.2.1"
)
default_attributes 'builder' => "Development"
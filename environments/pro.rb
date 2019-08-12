name "pro"
description "For Production"
cookbook_versions({
    "chef-training" => "= 0.2.0"
})

default_attributes({
    'chef-training' => {"yourName" => "Production"}
})
name "dev"
description "For developer"
cookbook_versions({
    'chef-training'=>'= 0.2.0',
    'os-hardening'=>'= 4.0.0'
  })

default_attributes({
    "chef-training" =>{ "yourName" => "Development"}
})
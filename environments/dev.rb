name "dev"
description "for Dev"
cookbook_versions({
  "chef-training" => "= 1.0.0",
  "os-hardening" => "= 1.4.1"
})
default_attributes "yourname" => "Devolopment"

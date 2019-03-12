name "security"
description "kata-role"
run_list "recipe[os-hardening::default]"
default_attributes({
  'os-hardening' => { 'auth' => {
     'uid_min' => '999' }
   }
})

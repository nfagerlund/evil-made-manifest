case $domain {
  default: { notify {"Not sure what this is.":} }
  /lo/:    { notify {"well it's on lo-SOMETHING.":} }
  "local": { notify {"this is on local domain":} }
  "lan": { notify {".lan for some reason???":} }
  "corp.puppetlabs.net": { notify {"lol we moved offices":} }
}

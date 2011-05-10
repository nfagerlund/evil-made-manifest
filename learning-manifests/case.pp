case $operatingsystem {
  redhad,centos: {notice("Hi redhat, ${operatingsystem}")}
  default: {notice("fail")}
}
if "CentOS" == "centos" {notice("Hey, I can't believe that worked.")}
else {notice("Ok, case sensitive.")}

case $operatingsystem {
  redhat, /(?i)^cent/: {notice("Hey, lists of rexegen work")}
  default: {notice("didn't work.")}
}


notify {'notbunk':}
# Test truth of various false things, and test str2bool a lot
if 0 {notice("zero is true")}
if -1 {notice("minus one is true")}
if Notify['notbunk'] {notice("defined resource reference is true")}
if Notify['bunk'] {notice('undefined resource reference is true')}
if Nonexistant['bunk'] {notice('nonexistant type of resource reference is true')}
if str2bool(0) {notice("str2bool 0 is true")}
if 'no' {notice("no is true")}
if str2bool('no') {notice("str2bool no is true")}
if undef {notice("undef is true")}
if str2bool(undef) {notice("str2bool undef is true")}
if nil {notice("nil is true")}
if 'nil' {notice("quoted nil is true")}
if '' {notice('empty string is true')}
#if str2bool(nil) {notice("str2bool nil is true")}
# if str2bool('nil') {notice("str2bool quoted nil is true")}
notice(false)
notice("and now for some pathology")
notice(str2bool(undef))
# notice(str2bool(true))
# notice(str2bool(false))
if [] {notice("empty array is true")}
if {} {notice("empty hash is true")}

$myregex = "blah"
# ugh can't put a regex in a variable?

case blah {
  true: {notice("case value is true")}
  false: {notice("case value is false")}
  $myregex: {notice("case value is bl--")}
  default: {notice("case value is neither")}
}

notice(bareword)
# notice(class)
notice(nil)


# this is funny: the class settings gets auto-declared. But it can't see the settings namespace! Even if you explicitly scope it from the top!
# class settings {
#   notify{'hahahaha':}
#   notify{"${::settings::modulepath}":}
# }

# ok functions aren't reserved words
notice(notice)
notice(str2bool)
notice(include)

notice("8.8"*"-8")

# lol
# class class { notify {'class class works':} }
# include class
# 
# class node { notify {'class node works':} }
# include node

# Holy shit this one actually works, probs cause of having to quote node names
# node 'node' { notify {'node node works':} }


if !'st' { notice("not string is true")}
if !'' {notice("not empty string is true")}


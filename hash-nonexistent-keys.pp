# Nonexistent hash keys, undef, and the empty string.

# Try it with Puppet 3.7.1 and the future parser on/off

$myhash = {"foo" => 123}

if($myhash['bar']==""){
  notice "Nonexistent key == ''"
  }else{
  notice "Nonexistent key != ''"
  }

if($myhash['bar']==undef){
  notice "Nonexistent key == undef"
  }else{
  notice "Nonexistent key != undef"
  }

if(''==undef){
  notice "'' == undef"
  }else{
  notice "'' != undef"
  }

if(undef==''){
  notice "undef == ''"
  }else{
  notice "undef != ''"
  }

$myary = ["foo", "bar"]

if($myary[2]==""){
  notice "Nonexistent array member == ''"
  }else{
  notice "Nonexistent array member != ''"
  }

if($myary[-3]==undef){
  notice "Nonexistent array member == undef"
  }else{
  notice "Nonexistent array member != undef"
  }

notice(spew_too($myary[-3]))
notice(spew_too(undef,undef, $myary))
notice("${undef}")
# are you allowed to set logoutput to any valid log level, like the attribute description says?
# NOPE. Cf. commit bb8051bc406d1da67db8212e852bb36d1368e953 in puppet.

exec {"/opt/local/bin/cowsay 'She only comes out at night / The lean and hungry type'":
  logoutput => true,
  loglevel  => debug,
}

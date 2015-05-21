notice( spew( Optional[String] ))
# 4.0.0: Notice: Scope(Class[main]): [Puppet::Pops::Types::POptionalType]
# [Puppet::Pops::Types::POptionalType]

notice( spew( Optional["hi i'm a string"] ))
# 4.0.0: Error: Evaluation Error: Optional-Type[] arguments must be types. Got String at /Users/nick/Documents/manifests/future_41_optional_notundef_struct_pup-4483.pp:5:24 on node magpie.lan
# 4.1.0: Error: Evaluation Error: Optional-Type[] arguments must be types. Got String at /Users/nick/Documents/manifests/future_41_optional_notundef_struct_pup-4483.pp:5:24 on node magpie.lan
# 4.1.0 at 615843e1a:
# Notice: Scope(Class[main]): [Puppet::Pops::Types::POptionalType]
# [Puppet::Pops::Types::POptionalType]

notice( spew( NotUndef[String] ))
# 4.1.0: Notice: Scope(Class[main]): [Puppet::Pops::Types::PNotUndefType]
# [Puppet::Pops::Types::PNotUndefType]

notice( spew( NotUndef["hi i'm a string"] ))
# 4.1.0: Notice: Scope(Class[main]): [Puppet::Pops::Types::PNotUndefType]
# [Puppet::Pops::Types::PNotUndefType]

# Henrik's example showing that default values from defined types are actually relevant... it's just that defines are lazily evaluated, so you would have to access them from ANOTHER define.
define foo($bar=20) {
  notice "bar is $bar"
}

define display {
  notify {y: message => "foo[bar] = ${Foo[x][bar]}"}
}

foo{x: }
display{y: }

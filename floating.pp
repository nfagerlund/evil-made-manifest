# In 2.7.9 and many other contemporaneous versions, alpha and beta notifies will happen in stage[before], but the gamma notify will happen in stage[main]. Dan Bode says this originated between 2.6.8 and 2.6.9. Nick Lewis says it's a recursion bug, which was about when I tuned out. See emails of Friday, Jan 6 2011. (two separate threads.)

stage { 'before': before => Stage['main'], }

class alpha {
  include beta
  notify { "alpha: stage=$stage": }
}
class beta {
  include gamma
  notify { "beta: stage=$stage": }
}
class gamma {
  notify { "gamma: stage=$stage": }
}
class { 'alpha': stage => 'before', }


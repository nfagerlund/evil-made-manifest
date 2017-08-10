# 1 is a string but 1*1 is a Fixnum
$a=1
$typea=inline_template("<%= @a.class %>")
notify{$typea:}
$b=1*1
$typeb=inline_template("<%= @b.class %>")
notify{$typeb:}

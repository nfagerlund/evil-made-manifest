# This was to test whether I could finally figure out what the "search" function did. And I did! Hurray. Bug #15576.
class parent {
    define doessomething { notice("parentvar is set, in the parent::doessomething define") }
    class whoa { notice("Okay that works w/ classes too") }
    $otherparentvar = "haha whoa"
}
search('parent')
doessomething{'something':}
include whoa
notice($otherparentvar) # This one doesn't work though, because it attaches the NAMESPACE, not the scope.

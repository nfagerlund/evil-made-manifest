if defined(fileservertest) { notice("Class fileservertest must be getting autoloaded.") }
if defined(totallyfakeclassthatdontexist) { notice("Class totallyfakeclassthatdontexist is somehow existing.") }
if defined(fileservertest::fakesub) {notice("Class fileservertest::fakesub is somehow existing.") }


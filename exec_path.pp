exec {"whoami":
    command => 'whoami',
    # The experiment: Does using the 'shell' provider let you use the default system $PATH?
    # The answer: Yes! And if you switch provider to posix, it'll fail as predicted. 
    logoutput => true,
    provider => shell,
}

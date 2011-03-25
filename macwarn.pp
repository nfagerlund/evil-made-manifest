notify { "Mac warning":
    message => $operatingsystem ? {
        'Darwin' => "This seems to be a Mac.", 
        default => "And I'm a PC.",
    },
}


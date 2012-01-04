# Prove that $title belongs to the container, not the native resource that references it.
class mytitle {
    notify {'tattler':
        message => "My title is $title.",
    }
}

#class {'mytitle':}
include mytitle


define feep ($msg = $title) {
    notify {"$title":
        message => $msg,
    }
}


feep {"some message":
    # name => "The name message",
}

feep {"some other message":
    msg => "The name message",
}


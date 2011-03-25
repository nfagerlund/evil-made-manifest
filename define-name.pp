define feep ($msg = $name) {
    notify {"$name":
        message => $msg,
    }
}


feep {"some message":
    # name => "The name message",
}

feep {"some other message":
    name => "The name message",
}

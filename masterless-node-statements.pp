# Node statements work with puppet apply.
node default {
    notify {'This is coming from node default! Awesome.':}
}
node /magpie/ {
    notify {'This is coming from node magpie! Looks like that worked.':}
}


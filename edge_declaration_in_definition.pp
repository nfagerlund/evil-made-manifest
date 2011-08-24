# question: Can I set dependency edges in a define while it's being instantiated? 
# Answer: And how! Very very nice. 

class generically::required {
    notify {"This should fire before any of those defines.":}
}

define specific::requirer ($msg = $name) {
    notify { "${name}_notify":
        message => "$msg",
    }
    Class['generically::required'] -> Specific::Requirer["$title"]
}

specific::requirer {'first_one':}
specific::requirer {'second_one': msg => "This is the second requirer instance.",}
class {'generically::required':}

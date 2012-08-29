# This was testing whether you can assign resources to a stage, and was going to be rather complidcated, as you can see.
# RESULT: You just plain can't assign a non-class resource to a stage!

stage {'prior': before => Stage['main'] }

class hasathing {
  notify {'This is from class hasathing, and is not directly associated with a stage.':}
  notify {'This is from class hasathing, and is directly associated with stage prior.':
    stage => prior,
  }
  notify {'this is from class hasathing, and is directly associated with stage main.':
    stage => main,
  }
}

notify {'This is from outside, and is directly associated with stage prior.':
  stage => prior,
}


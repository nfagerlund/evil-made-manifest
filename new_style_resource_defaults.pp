# So it looks like using the semicolon at the end of the block like that, on a newline, works fine. So does putting a semicolon directly after the colon! 
notify {
  default:
    message => 'did this work. yoes or no.',
  ;
  mynotify:;
}


function ls_find {
  ls -FGl -d $(find $@ )
}
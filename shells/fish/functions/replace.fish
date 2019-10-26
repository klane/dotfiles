function replace --description 'Find and replace patterns in a given list of files.'
  set find_this $argv[1]
  set replace_with $argv[2]
  rg -l $find_this $argv[3..-1] | xargs sd $find_this $replace_with
end

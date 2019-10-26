function gcd --description 'Change directory to local repository cloned with ghq.'
  if test (count $argv) -eq 0
    set repo (ghq list | fzf)
  else
    set repo (ghq list | grep $argv[1])
  end

  cd (ghq root)/$repo
end

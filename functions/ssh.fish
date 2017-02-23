function ssh
  if [ $argv ]
    bash -c "ssh $argv"
  else
    ag '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read selected
    if [ $selected ]
      bash -c  "ssh -o $selected"
    end
  end
end

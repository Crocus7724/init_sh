function ssh
  if [ $argv ]
    bash -c "ssh $argv"
  else
    ag '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read selected
    if [ $selected ]
      commandline -i "ssh $selected"
    end
  end
end

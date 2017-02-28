function kill
  if [ "$argv" ]
    bash -c "kill $argv"
  else  
    ps -ef | sed 1d | fzf -m | awk '{print $2}' | read ps
    if [ "$ps" ]
      commandline "kill -9 "$ps
    end
  end
end

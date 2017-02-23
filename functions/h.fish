function fzf_select_history
    history|fzf --exit-0 --select-1 |read slct
  if [ $slct ]
    commandline $slct
  else
    commandline $query
  end
end

function h
  fzf_select_history
end

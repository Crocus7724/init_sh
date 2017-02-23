function op
  if [ (uname) = 'Darwin' ]
    commandline "open "
    find /Applications -name "*.app" -type d -maxdepth 2 |  fzf --query=$argv --select-1 --exit-0 | sed "s/ /\\\ /g" |read app
    if [ $app ]
      commandline (commandline)'-a '"$app"' ' 
    end

    fzf --query=$argv --multi --select-1 --exit-0 | read files
    if [ $files ]
      commandline (commandline)$files
    end
  end
end  

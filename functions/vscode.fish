set VSCODE_PATH /Applications/Visual\ Studio\ Code.app

function vscode
  if [ (uname) = 'Darwin' ]
    if [ $argv ]
      open -a $VSCODE_PATH $argv
    else
      fzf | read x
      if [ $x ]
        open -a $VSCODE_PATH $x
      end
    end
  end
end

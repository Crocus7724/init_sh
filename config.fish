# rbenv
#eval "$(rbenv init -)";
# set -x PATH $HOME/.rbenv/bin $PATH
. $HOME/.config/fish/functions/extra_cd.fish
set -x PATH $HOME/.rbenv/shims $HOME/.cargo/bin $PATH
set -x GOPATH $HOME/.go
rbenv rehash >/dev/null ^&1


  set -l peco_bin (which peco)
  if not test -n "$peco_bin"
    echo "⚫  Please install 'peco' first: brew install peco"
  else
    function peco_select_history
      set -l query (commandline)
      if test -n $query
        set peco_query --query "$query"
      end

      history|peco $peco_query|read slct
      if [ $slct ]
        commandline $slct
      else
        commandline $query
      end
    end

    function fish_user_key_bindings
      bind \cx __exit
      bind \cr peco_select_history
    end
  end

function cd
  if test (count $argv) -eq 0
    peco_change_directory
  else if test $argv = ".." 
    _parent_dirs | peco | read d
    if test (string length "$d") -ne 0
      builtin cd $d
    end
  else
    builtin cd $argv
  end
  ls -a
end

function peco
  command peco --layout=bottom-up $argv
end

function vscode
  if test (uname) = "Darwin"
    open -a /Applications/Visual\ Studio\ Code.app $argv
  end
end

function h
  peco_select_history $argv
end

function _parent_dirs
  set d (dirname (pwd))
  echo $d
  while test $d != "/"
    set d (dirname $d)
    echo $d
  end
end

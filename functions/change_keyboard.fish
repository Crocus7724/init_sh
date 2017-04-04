set KARABINER_CONFIG $HOME/.config/karabiner/configs

function change_keyboard
  if [ -e $KARABINER_CONFIG/built-in_keyboard/karabiner.json ]
    mv $KARABINER_CONFIG/../karabiner.json $KARABINER_CONFIG/realforce/
    mv $KARABINER_CONFIG/built-in_keyboard/karabiner.json $KARABINER_CONFIG/../
  else
    mv $KARABINER_CONFIG/../karabiner.json $KARABINER_CONFIG/built-in_keyboard/
    mv $KARABINER_CONFIG/realforce/karabiner.json $KARABINER_CONFIG/../
  end
end 

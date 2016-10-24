function pwd_prompt
  if test $PWD = $HOME
    echo "~"
  else
    echo (basename $PWD)
  end
end

function current_mode
  echo -n "⟦"
  switch $fish_bind_mode
    case default
      set_color --bold E6DB74
      echo -n "NORMAL"
    case insert
      set_color --bold 66D9EF
      echo -n "INSERT"
    case visual
      set_color --bold FD971F
      echo -n "VISUAL"
  end
  set_color normal
  echo -n "⟧"
end

function fish_prompt
  printf "%s%s%s@%s%s%s:%s%s%s%s» " (set_color --bold FD971F) (whoami) (set_color normal) (set_color --bold F92672) (hostname) (set_color normal) (set_color 66D9EF) (pwd_prompt) (set_color normal) (__terlar_git_prompt)
end

function fish_right_prompt
  set -l _status $status
  echo -n "⟦"
  if test $_status = 0
    set_color --bold A6E22E
  else
    set_color --bold EF5939
  end
  date +"%T"
  set_color normal
  echo -n "⟧"
end

function fish_mode_prompt
  current_mode
  echo -n ":"
end


set -l linuxbrew_bin_path "$HOME/.linuxbrew/bin"
#set -l linuxbrew_sbin_path "$HOME/.linuxbrew/sbin"
set -l linuxbrew_manpath "$HOME/.linuxbrew/share/man"
set -l linuxbrew_infopath "$HOME/.linuxbrew/share/info"

contains -- $linuxbrew_bin_path $PATH
  or set -gx PATH $linuxbrew_bin_path $PATH

contains -- $linuxbrew_sbin_path $PATH
  or set -gx PATH $linuxbrew_sbin_path $PATH

contains -- $linuxbrew_manpath $MANPATH
  or set -gx MANPATH $linuxbrew_manpath $MANPATH

contains -- $linuxbrew_infopath $INFOPATH
  or set -gx INFOPATH $linuxbrew_infopath $INFOPATH

# precious little scripts
set -gx PATH "$HOME/bin" $PATH

set -gx EDITOR "nvim"

# go
set -gx GOPATH "$HOME/gocode"
set -gx PATH "$HOME/gocode/bin" $PATH



# ruby gems
set -gx PATH "$HOME/.gem/ruby/2.3.0/bin" $PATH

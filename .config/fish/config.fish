set PATH $PATH  ~/Go/bin
export GOPATH=$HOME/go

function godel
   if string length -q $argv
      rm -rf $GOPATH/src/$argv
      rm -rf $GOPATH/pkg/darwin_amd64/$argv.a
      find $GOPATH -type d -empty -delete
   else
      echo you must send an argument
   end
end

function nvm
      bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_status (git status -s)

  if test -n "$git_status"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  if test -n "$git_dir"
    printf '%s@%s %s%s%s:%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
  else
    printf '%s@%s %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end

alias gomain='go run main.go'
alias cls='clear && echo -en "\e[3J"'
alias goland='/usr/local/bin/goland'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

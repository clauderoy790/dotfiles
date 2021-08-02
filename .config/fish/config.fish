#export JAVA_HOME=(/usr/libexec/java_home -v "16.0.1")
export JAVA_HOME=(/usr/libexec/java_home -v "1.8.0")
export ANDROID_HOME=$HOME/Library/Android/sdk
export SPOTIFY_ID=b4becf4b963c478494f5f6945cd3f07e
export SPOTIFY_SECRET=4901f818e7a94068ab2f64e8018b7dce

set PATH $PATH ~/flutter/bin ~/Go/bin $JAVA_HOME $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin $HOME/.gobrew/current/bin $HOME/.gobrew/bin

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

alias gomain='go run main.go'
alias python2=/usr/local/bin/python2.7
alias python=python3
alias cls='clear && echo -en "\e[3J"'
alias goland='/usr/local/bin/goland'
alias d2="cd ~/.wine_d2/drive_c/games/diablo\ ii/mod\ plugy && WINEPREFIX=~/.wine_d2 wine plugy.exe -w -3dfx -nofixaspect -direct -txt"
alias pd2l="cd ~/.wine_pd2/drive_c/Program\ Files/Diablo\ II/ProjectD2 && WINEPREFIX=~/.wine_pd2 wine PD2Launcher.exe"
alias pd2="cd ~/.wine_pd2/drive_c/Program\ Files/Diablo\ II/ProjectD2 &&  WINEPREFIX=~/.wine_pd2 wine game.exe -skipbnet"
alias pod="$GOPATH/src/gitlab.com/claude.roy790/pod-patcher/pod-patcher '/Users/clauderoy/.wine_d2_pod/drive_c/games/Diablo II/Path of Diablo' && cd '/Users/clauderoy/.wine_d2_pod/drive_c/games/Diablo II/Path of Diablo' && WINEPREFIX=~/.wine_d2_pod wine 'Path of Diablo Launcher.exe'"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

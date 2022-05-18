set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk-11.0.12.jdk/Contents/Home
set -x ANDROID_SDK_ROOT ~/Library/Android/sdk
set -x PATH $PATH ~/Go/bin $ANDROID_SDK_ROOT
set -x PATH $PATH $ANDROID_SDK_ROOT/tools/bin
set -x PATH $PATH $ANDROID_SDK_ROOT/platform-tools
set -x PATH $PATH $ANDROID_SDK_ROOT/emulator

set -x GOPATH ~/Go
set -x CDPATH . $GOPATH/src/github.mheducation.com/SpaceJam $GOPATH/src/github.com
set -x PRIVATE_TOKEN 7b4566a9395cf34625e1352f6df8e1d1b75ea8b4

#AWS env vars
set -x AWS_ACCESS_KEY_ID "ASIA5RRUJCXOKSUOZ36Q"
set -x AWS_SECRET_ACCESS_KEY "hPDqVvSlu2xaUKI4YnXel/6PrqJMbLLleHkE5KoE"
set -x AWS_SESSION_TOKEN "IQoJb3JpZ2luX2VjEOn//////////wEaCXVzLWVhc3QtMSJHMEUCID3HBxdqsvUFO9g8Cls/4DCRYN8NZSbYMgUnQiG/rBBHAiEAo60x+f3MIk5MXw0vX3TwNCSk6qJyBzxcXR/o0uMbiKAqpwMIwf//////////ARADGgw5MzEwNDM4MDg3MzIiDF6f4zE+u5I0wvdZpSr7Ai7ntqS+ZznvvmEUe4ZSDqQhoGbLZ7cnpzMxxRJrC2DFFKnGTPIQrhpmvRtUd1FeUkQANdyquVRZmCZGzjtb2Uy3Symlg601l5hGRK1j81LkMnILS4p3XU21EdLQr2DmFd2KHlcRP4c7zfLgsdx/bOY8eb580CGANyrNGtIZDrpBQC5Jro6HEwtJn/P1He+6szVO33cIgVKu2DsR3SELIaQ7G7oJJjKn/oHnBzOGjwaT6yNj11OcY8T5iZ0LfgsNUfnBer2Oak1idksZO9Atp68tWqdFQJNm0PjfcPC97uQPrqIzDtewM34rAzIRozWvikUUZ2yeYwRgXj+UgmO2UMWuQRFxw20YIZG6/pZbRMFVaYA6YmmI8+WaKmBfQQ6a1OUYYEObpCCIMxrq9zksU3BscQZ9BdP154eVg7ca0q59uksTZxIhAVDPHN8L0r2F92yxISexPQKjPS/vT4x8f7MT0smLdkM25sQ3MlIFYPzYD5/dUbq9bUphKEUwkpaPlAY6pgEnRqeItYxRUg2qh0o9Ak8pTL6hMyCF0QfTBmh4eqTLCxW/mEc+TDUmHXCaPqqetjEFUaY0hpLG+7/OFOJgVNb4GyWF4vrp6kbnacus1ewjeXwRAb8toaK2MAqdLzVbsQertJd3QQHriARjHw9GR0jORAT0RGqZI7pi0I2p/7zsf1W8iYgVmB3c5Lxiu4uufAUd91h/Y+1OEfJ24E9cJ5CWGRE0u8V7"

set -x PATH "/Library/Frameworks/Python.framework/Versions/3.9/bin" "$PATH"

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

alias cls='clear && echo -en "\e[3J"'
alias goland='/usr/local/bin/goland'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias testItAll='make qt && make lint && make format'
alias psReadAwk="make SDLC=qastg ps-read | awk '{print $1 "\t" $6}'"
alias allowApp='xattr -d com.apple.quarantine'

# Go aliases
alias gomain='go run main.go'
alias GTA='go test ./... -v'
alias GTAGF='go test ./... -v | grep FAIL'

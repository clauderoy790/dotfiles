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

alias cls='clear && echo -en "\e[3J"'
alias goland='/usr/local/bin/goland'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias testItAll='make qt && make lint && make format'
alias python='python3'
alias psReadAwk="make SDLC=qastg ps-read | awk '{print $1 "\t" $6}'"
alias allowApp='xattr -d com.apple.quarantine'
alias ef='vim ~/.config/fish/config.fish'
alias sf='source ~/.config/fish/config.fish'

# Go aliases
alias gm='go run main.go'
alias GTA='go test ./... -v'
alias GTAGF='go test ./... -v | grep FAIL'

# Work
alias updateIAT='npm i @mhe/dle-lti-admin-tools-ui-ngx'

# Nvm
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Cool functions
set -x EX_DIR ~/Desktop
function exGof
	rm -f $EX_DIR/$argv.go
	touch $EX_DIR/$argv.go
	printf "package main\n\nfunc main() {\n\n}" > $EX_DIR/$argv.go
	code $EX_DIR/$argv.go
end

function exGo
	rm -f $EX_DIR/$argv.go
	rm -rf $EX_DIR/$argv
	mkdir $EX_DIR/$argv
	set d $PWD
	cd $EX_DIR/$argv
	go mod init test
	cd $d

	touch $EX_DIR/$argv/main.go
	printf "package main\n\nfunc main() {\n\n}" > $EX_DIR/$argv/main.go
	
	code $EX_DIR/$argv -n
	code $EX_DIR/$argv/main.go -r
end

function exTS
	rm -f $EX_DIR/$argv.ts
	touch $EX_DIR/$argv.ts
	code $EX_DIR/$argv.ts
end

function cleanDesktop
	for file in ~/Desktop/*                                                                           Mon May 30 22:42:09 2022
        	rm -rf $file
        end
end

# Rebase main branch on current
function roc
	# if status is set, don't do anything
	set -l st (git status -s)
	if test -n "$st"
		echo "can only rebase when status is clean"
		return 0
	end

	set currB (git branch --show-current)
	set mainB master
	if test -n "$argv"
		set mainB $argv
	end

	# return if on main branch
	if string match $mainB $currB
		echo "already on main branch"
		return 0
	end

	# pull main branch and rebase on current
	git checkout $mainB 
	git pull
	git checkout $currB
	git rebase $mainB

	# cleanup
	set -e mainB
	set -e currB
end

# Add all files in Git, commit and push
function gca
	set -l message "update"
	if test -n "$argv"
                set message $argv
        end

	git add -A
	git commit -m $message
	git push
end

# Squash commits. First argument is the message  will use the oldest commit message if none is provided.
# the second argument is the number of commits to squash together, default value is 2.
function sc
	# check if number is between 1 and 10, otherwise only squash last 2 commits
	set -l nbCommits 2
	if test -n "$argv[2]"; and  not string match --quiet --regex '\D' $argv[2]; and test $argv[2] -gt 0; and test $argv[2] -lt 10
		set nbCommits $argv[2]
	end

	#set default commit message to the oldest commit specified
	set -l commitMessage (git log --format=%s -n $nbCommits | sed -n "$nbCommits p")
	
	# check if the first argument is a number, if so squash that number of commits with the oldest message
	if test -n "$argv[1]"; and  not string match --quiet --regex '\D' $argv[1]; and test $argv[1] -gt 0; and test $argv[1] -lt 10
		echo "in that special csase"
		set nbCommits $argv[1]	
		set commitMessage (git log --format=%s -n $nbCommits | sed -n "$nbCommits p")
	else if test -n "$argv[1]"
		echo "normal case"
		set commitMessage $argv[1]
	end

	git reset --soft HEAD~$nbCommits && git commit -m $commitMessage
	gpf
end

# Rename a commit
function rnc
	# check if commit message is not provided
	if test -z "$argv"
		echo "please provide a commit message"
		return 0
	end
	
	ec $argv
	sc $argv
end

# git push force with lease
function gpf
	git push --force-with-lease
end

# empty commit
function ec
	git commit -m $argv --allow-empty
end

####################################
# BASH
####################################
# MAKE TERMINAL BETTER
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation

#   List aliases
#   ------------------------------------------------------------
alias l="ls -l --color"                     # l:    List all files colorized in long format
alias la="ls -la --color"                   # la:   List all files colorized in long format, including dot files
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias lsd='ls -l | grep "^d"'               # lsd:  List only directories
alias ls="command ls -G"                    # ls:   list alias with -G
#alias less='less -FSRXc'                    # Preferred 'less' implementation

#   Change directory
#   ------------------------------------------------------------
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside

if [[ $(uname -s) == 'Darwin' ]]; then
    alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
    trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
    ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
    alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
fi

alias drives="df -h"                                        # list all drives
alias listen="sudo lsof -i -P | grep -i \"listen\""         # listen all apps on ports

alias please="sudo"
alias reload="source ~/.bash_profile"
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

if [[ $(uname -s) == 'Darwin' ]]; then
    alias preview="open -a '$PREVIEW'"
    alias xcode="open -a '/Developer/Applications/Xcode.app'"
    alias safari="open -a safari"
    alias firefox="open -a firefox"
    alias opera="open -a opera"
    alias chrome="open -a google\ chrome"
fi

mans () {
    man $1 | grep -iC2 --color=always $2 | less
}

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

####################################
# SEARCHING
####################################
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

####################################
# NETWORKING
####################################

####################################
# GIT
####################################
alias gcl='git clone'
alias gst='git status'
alias gsts='git status -s'
alias gad='git add'
alias gada='!git add -u && git add . && git status'
alias gcm='git commit'
alias gcmm='git commit -m'
alias gcmam='git commit -am'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcod='git checkout develop'
alias gpl='git pull'
alias gplom='git pull origin master'
alias gpsom='git push origin master'
alias gplod='git pull origin develop'
alias gpsod='git push origin develop'
alias gpso='git push origin'
alias gplo='git pull origin'
alias gps='git push'
alias gpl='git pull'
alias gdf='git diff'
alias gdfno='git diff --name-only HEAD~1'
alias gdfno2='git diff --name-only HEAD~2'
alias gdfno3='git diff --name-only HEAD~3'
alias gdfa='git diff @{1}'
alias gbr='git branch'
alias gbra='git branch -a'
alias gbrd='git branch -d'
alias gmr='git merge --no-ff'
alias gmrd='git merge --no-ff develop'
alias gmrm='git merge --no-ff master'
alias glg="git log --graph --pretty=format:'%C(bold red)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold green)<%an>%Creset' --abbrev-commit --date=relative"
alias ggrep='!git ls-files | grep -Ii'
alias gall='!git config -l | grep alias | cut -c 7-'
alias gtgl='describe --tags --abbrev=0'
alias gunpushed="git log --branches --not --remotes --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset%s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

####################################
# MAGENTO 2 (local scope)
####################################
alias m2="./bin/magento"
alias m2-bin="./bin/magento"
alias m2-unit="./vendor/bin/phpunit"
alias m2-phpcs="./vendor/bin/phpcs"
alias m2-phpmd="./vendor/bin/phpmd"
#. /usr/local/etc/bash_completion.d/magento2-bash-completion

# Check is the current directory is of M2 root
assertM2Root() {
    if [[ ! -f './bin/magento' ]] && [[ ! -f './app/etc/di.xml' ]]; then
        printf "Current directory is not Magento2 root."
        return 1
    fi
}

# Enable Magento module(s) with setup-upgrade
m2ModuleEnable() {
    assertM2Root || return
	m2 module:enable $1 --clear-static-content && m2 setup:upgrade
}
alias m2-module-enable="m2ModuleEnable"
alias m2-mod-enable="m2ModuleEnable"

# Clear settings/dependencies cache + theme related cache
m2CacheFlush() {
    assertM2Root || return

    for arg in "$@"
    do
        case $arg in
            -r|--redis)
                echo 'Flushing redis cache...'
                redis-cli flushall
            ;;
            -v|--varnish)
                echo 'Flushing varnish cache...'
                systemctl restart varnish
            ;;
            -t|--theme)
                echo 'Flushing theme cache...'
                rm -rf ./var/view_preprocessed/ ./pub/static/frontend/
            ;;
            -c|--cache)
                echo 'Flushing default cache...'
                rm -rf ./var/cache/ ./var/page_cache/ generated/code/
            ;;
            *)
                # default
            ;;
        esac
    done
    if [[ $# -lt 1 ]]; then
        echo 'Flushing default cache...'
        rm -rf ./var/cache/ ./var/page_cache/ generated/code/
    fi
}
alias m2-cache-flush="m2CacheFlush"
alias m2-cflush="m2CacheFlush"
alias m2-cache-clean="m2CacheFlush"
alias m2-cclean="m2CacheFlush"

####################################
# LOCALHOST DEV
####################################
osType=
if [[ $(uname -s) == 'Darwin' ]]; then
    alias nginx-restart="brew services restart nginx"
else
    alias server-log="tail -f /var/log/*/*.log"
    alias nginx-log="tail -f /var/log/nginx/*.log"
    alias nginx-log-min="tail -f /var/log/nginx/*.log | egrep -v '(.gif|.jpg|.png|.swf|.ico|.txt|.xml|.css|.js|.rss)"
    alias m2-log="tail -f ./var/log/*.log /var/log/*/*.log"
    alias m2-log-dev="tail -f ./var/log/!(support_report).log /var/log/*/*.log | egrep -v '(.gif|.jpg|.png|.swf|.ico|.txt|.xml|.css|.js|.rss)"
    alias m2-log-mon="tail -f ./var/log/exception.log /var/log/php*.log /var/log/nginx/*error*.log"
fi

################################################################################
# Warden Aliases
# @website: https://www.magepsycho.com
# @author: Raj KB <magepsycho@gmail.com>
################################################################################

# Create and start containers
wardenEnvUp() {
	warden env up
}
alias wup="wardenEnvUp"

# Stop services
wardenEnvStop() {
	warden env stop
}
alias wst="wardenEnvStop"

# Connects to `php-debug` container shell
wardenDebug() {
	warden debug
}
alias wdg="wardenDebug"

# Connects to `php-fpm` container shell
wardenShell() {
	warden shell $1
}
alias wsh="wardenShell"

# Executes M2 commands on `php-fpm` container shell
wardenShellM2() {
	warden shell -c "bin/magento $1"
}
alias wm2="wardenShellM2"

# Executes MageRun commands on `php-fpm` container shell
wardenShellMageRun() {
	warden shell -c "n98-magerun $1"
}
alias wmr="wardenShellMageRun"

# Executes Redis commands
wardenRedis() {
	warden redis $1
}
alias wrd="wardenRedis"

# Executes DB related commands
wardenDb() {
	warden db $1
}
alias wdb="wardenDb"

# Tail logs from different containers
wardenLogs() {
	warden env logs --tail 0 -f nginx php-fpm php-debug
}
alias wlg="wardenLogs"

# Executes environment related commands
wardenEnv() {
	warden env $1
}
alias wenv="wardenEnv"

################################################################################

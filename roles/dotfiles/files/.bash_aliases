#!/bin/bash

# --------------------------------------------------------------------------------
# Edit dotfiles
# --------------------------------------------------------------------------------
vs() {
    vim $1;
    source $1;
}
alias ev='vim ~/.vimrc'
alias ea='vs ~/.bash_aliases'
alias eal='vs ~/.bash_aliases_local'
alias eb='vs ~/.bashrc'
alias ebm='vs ~/.bashrc_mods'
alias ebl='vs ~/.bashrc_local'
alias ep='vs ~/.profile'
alias et='vim ~/.tmux.conf'

# --------------------------------------------------------------------------------
# Various short-hand commands
# --------------------------------------------------------------------------------
# Text editing
alias e='vim'
alias v='vim'
alias n='nano'
# Aptitude
alias aptg='sudo apt-get install'
alias aptr='sudo apt-get remove'
alias apts='apt-cache search'
alias aptu='sudo apt-get update'
alias aptug='sudo apt-get upgrade'
alias ubuntu_version='lsb_release -a'
# Git
alias t='tig'
alias glog='git log --pretty=oneline|tig'
alias gdiff='git diff|tig'
alias gcommit='git commit'
alias gpush='git push'
alias gpp='git pull origin master; git push origin master;'
alias gprp='git pull --rebase origin master; git push origin master;'
alias gadd='git add'
alias gb='git branch -av'
alias dus='du -sh * | sort -h'
alias dusa='du -ash .* | sort -h'
# SSH
alias sshpass='ssh -o PubkeyAuthentication=no'
alias scppass='scp -o PubkeyAuthentication=no'
# Screen
alias sl='screen -ls'
alias sms='screen -mS'
alias sr='screen -r'
alias sdr='screen -dr'
ks() {
    screen -X -S $1 quit
}
# tmux
alias tn='tmux new'
alias tns='tmux new -s'
alias ta='tmux attach'
alias tas='tmux attach -t'
alias ts='tmux switch'
alias tss='tmux switch -s'
alias tl='tmux list-sessions'
# The ls command
alias ls='ls --color=auto -h'
alias l='ls -1'
alias la='ls -1a'
alias ltr='ls -1tr'
alias ltra='ls -1tra'
alias lltr='ls -ltr'
alias lltra='ls -ltra'
alias last='tail -n 1'
alias llast='ls -1tr | last'
alias slast='llast | xargs less -iS'
alias lslast='llast | xargs less -i'
# Misc
alias s='less -S'
alias py='python'
alias p='python'
alias ipy='ipython'
psa() {
	term=$1;
	echo "Now showing processes including $term in name ...";
	/bin/ps aux | grep "$term";
}
alias k='kill -9'
alias R='R --no-save'
padold() {
    mv $1{,.old}
}
padtmp() {
    mv $1{,.tmp}
}
pad() {
    mv $1{,.$2}
}
padrem() {
    mv $1{.$2,}
}
alias vg='vagrant'
alias vgu='vagrant up'
alias vgp='vagrant provision'
alias vgs='vagrant ssh'
alias vgd='vagrant destroy'
alias sm='snakemake'
function gitsshify() {
	echo 'git@github.com:'$1'.git';
}

# --------------------------------------------------------------------------------
# Directory browsing and handling
# --------------------------------------------------------------------------------
c() {
    cd "$1";
    ls -ltra --color=always | tail -n 25;
    echo " ";
    pwd;
}
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
mkcd() {
    mkdir -p $1;
    cd $1;
}

# --------------------------------------------------------------------------------
# Switch keyboard layout
# --------------------------------------------------------------------------------
alias kb='setxkbmap'
alias se='setxkbmap se'
us() {
    echo "Setting keyboard map to US";
    setxkbmap 'us';
	# Enable åäö by holding Alt Gr and [';
    xmodmap -e 'keycode 108 = Mode_switch';
    xmodmap -e 'remove mod1 = Mode_switch';
    xmodmap -e 'keycode 34 = bracketleft braceleft aring Aring';
    xmodmap -e 'keycode 48 = apostrophe quotedbl adiaeresis Adiaeresis';
    xmodmap -e 'keycode 47 = semicolon colon odiaeresis Odiaeresis';
}

# --------------------------------------------------------------------------------
# Create test file
# --------------------------------------------------------------------------------
alias foo='echo "Foo" > foo.txt'

# --------------------------------------------------------------------------------
# Misc advanced stuff
# --------------------------------------------------------------------------------
alias switchjava='sudo update-alternatives --config java'
topname() {
    top -p $(pgrep -d"," $1);
}
alias ...='echo … | xsel --clipboard'
time3() {
    if [[ ! -z "$2" ]]; then
        procs=$2;
        export GOMAXPROCS=$procs;
    fi;
    cmd=$1;
    echo "Benchmarking command: $cmd"
    echo "GOMAXPROCS: $GOMAXPROCS"
    t1=$({ time ./$cmd > output.txt; } 2>&1 |grep real|grep -oP "\d\.\d+")
    echo "Time 1: $t1"
    sleep 1
    t2=$({ time ./$cmd > output.txt; } 2>&1 |grep real|grep -oP "\d\.\d+")
    echo "Time 2: $t2"
    sleep 1
    t3=$({ time ./$cmd > output.txt; } 2>&1 |grep real|grep -oP "\d\.\d+")
    echo "Time 3: $t3"
    sleep 1
    echo "Average (3 samples): "`echo "scale=3; ($t1 + $t2 + $t3)/3.0"|bc`;
}
install_vundle() {
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
    echo "Now open vim and execute: :PluginInstall !"
}
bookmark() {
	if [[ ! $1 ]]; then
		echo "Usage: bookmark BOOKMARKNAME";
	else
		name=$1;
		dir=$(pwd);
		echo "alias c$name='c $dir'" >> ~/.bash_aliases_local
		source ~/.bash_aliases_local
	fi  
}
bookmarks() {
	cat ~/.bash_aliases_local | grep "alias c"
}
source ~/.bash_aliases_local
alias installflash='sudo apt-get install pepperflashplugin-nonfree'
alias updateflash='sudo update-pepperflashplugin-nonfree --install'
function lf() {
ls -1tr | tail -n 1;
}
alias cutt='cut -c -$COLUMNS'
div() { 
	echo "=========================================================================="
	echo " $1"
	echo "=========================================================================="
}
alias now='date +%Y%m%d_%H%M%S';
alias d='sudo docker'
alias docker='sudo docker'
p12_to_pem() {
	openssl pkcs12 -in $1 -out $1'.crt.pem' -clcerts -nokeys
	openssl pkcs12 -in $1 -out $1'.key.pem' -nocerts -nodes
}
dh() {
cat <<EOM
General commands:
    events    Get real time events from the server
    info      Display system-wide information
    login     Register or Login to the docker registry server
    version   Show the docker version information

Commands for working with images:
    build     Build an image from a Dockerfile
    history   Show the history of an image
    images    List images
    import    Create a new filesystem image from the contents of a tarball
    load      Load an image from a tar archive
    pull      Pull an image or a repository from the docker registry server
    push      Push an image or a repository to the docker registry server
    rmi       Remove one or more images
    save      Save an image to a tar archive
    search    Search for an image in the docker index
    tag       Tag an image into a repository

Commands for working with containers (instances of images):
    attach    Attach to a running container
    commit    Create a new image from a container's changes
    diff      Inspect changes on a container's filesystem
    cp        Copy files/folders from the containers filesystem to the host path
    export    Stream the contents of a container as a tar archive
    inspect   Return low-level information on a container
    kill      Kill a running container
    logs      Fetch the logs of a container
    port      Lookup the public-facing port which is NAT-ed to PRIVATE_PORT
    pause     Pause all processes within a container
    ps        List containers
    ps -a     List all containers (including stopped ones)
    restart   Restart a running container
    rm        Remove one or more containers
    run       Run a command in a new container
    start     Start a stopped container
    stop      Stop a running container
    top       Lookup the running processes of a container
    unpause   Unpause a paused container
    wait      Block until a container stops, then print its exit code
EOM
}

# Count lines of code
alias goloc="ls *.go | xargs cat | sed -r '/^(\s*\/\/.*)?$/d' | wc -l"
# Recursive version
alias golocr="find | grep -P '.go$' | xargs cat | sed -r '/^(\s*\/\/.*)?$/d' | wc -l"

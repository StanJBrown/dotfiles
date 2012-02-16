# Dir shortcuts
alias uni="cd $HOME/uni";
alias lp="cd $HOME/uni/lp";
alias wt="cd $HOME/uni/wt";

alias p="cd $HOME/proj/";
alias dotfiles="cd $HOME/proj/dotfiles";
alias s="cd $HOME/Sites/";
alias chotsfu="cd $HOME/Sites/chotsfu/"

# Executional shortcuts
alias ls="ls -h";
alias v="vim";
alias vimrc="vim ~/.vimrc";
alias bashrc="vim ~/.bash_profile";
alias remote="ssh -X cc218@cc218.host.cs.st-andrews.ac.uk"
alias server="ssh -X chutsu@chotsfu.com"

# Environment settings
export PATH="$PATH:$HOME/proj/scripts";

# Shell settings
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# MacPorts Installer addition on 2011-11-27_at_00:03:26: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# . bash_profile provides global configuration for all users. Bashrc is limited with current user.
# Wget : webGet : télécharge l'adresse donnée.
# set -e en mode bash : si une seule des commandes est/fini en  erreur,  le bash s'arrête
# dev/null : fichier spécifique unix tout ce qui est dedans est supprimé
# $? : code de retour de la dernière cmd exécutée
# mettre un fond de couleur sur les terminaux linux
mettre un echo dans le bashrc pour avoir les consignes quand on se loggue

grep --color -C context  = -B + -A ^pour grep
grep -rin "egrep test|azer"-> à quoi cela sert?



# pour quitter une session ssh gelée il suffisait de saisir les 3 touches "Entrée ~ ."
# ssh -X = ?

# Variables
# export PATH=$PATH:/opt/bin

# Prompt
# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;33m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"

BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'
PS1="${BLUE}(${RED}\w${BLUE}) ${NORMAL}\h ${RED}\$ ${NORMAL}"

# Aliases
alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias svim='sudo vim'
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias cim='vim'
alias back='cd $OLDPWD'
alias root='sudo su'
alias runlevel='sudo /sbin/init'
alias grep='grep --color=auto'
alias dfh='df -h'
alias h="history|grep "
alias f="find . |grep "
alias p="ps aux |grep "
alias k="kate $1"
alias source="source ~/.bashrc"

# Pour chercher un fichier et à l'intérieur une information
function findOcc(){ cd XWZ;find . -name $1 -print0 | xargs -0 grep $2;}

# Commande tree sous Linux 
# list= `grep  -r "@Usedcomponent" src/imp | awk -F ";"  '{printf $i"\n"}'`
# for i in  $list : do echo $i; cat $i | grep 'tpm' :done

#Other conf file
#if [ -f /etc/bashrc ]; then 
#        . /etc/bashrc 
#fi

echo -e "Bashrc chargé"

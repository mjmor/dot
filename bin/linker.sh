# link vimrc 
if [ -f ~/.vimrc ]; then
    rm -i ~/.vimrc 
fi
ln -s ~/dot_repo/vimrc ~/.vimrc

# link bashrc or bash_profile depending on OS
SYSTYPE=`uname -s`
if [[ $SYSTYPE =~ ^Darwin ]]
then 
    rm ~/.bash_profile &> /dev/null
    ln -s ~/dot_repo/bash_profile ~/.bash_profile
    source ~/.bash_profile
else
    if [ -f ~/.bash_aliases ]; then
        rm -i ~/.bash_aliases
    fi
    ln -s ~/dot_repo/bash_aliases ~/.bash_aliases
    if [ -f ~/.bashrc ]; then
        rm -i ~/.bashrc
    fi
    ln -s ~/dot_repo/bashrc ~/.bashrc
    source ~/.bashrc
    if [ -f ~/.ssh/config ]; then
        rm -i ~/.ssh/config
    fi
    ln -fs ~/dot_repo/ssh/config ~/.ssh/config
    chmod 600 ~/dot_repo/ssh/config
fi

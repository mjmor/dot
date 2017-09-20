# link vimrc
if [ -f ~/.vimrc ]; then
    rm -i ~/.vimrc
fi
ln -s ~/dot/.vimrc ~/.vimrc

# link bashrc or bash_profile depending on OS
SYSTYPE=`uname -s`
if [[ $SYSTYPE =~ ^Darwin ]]
then
    rm ~/.bash_profile &> /dev/null
    ln -s ~/dot/.bash_profile ~/.bash_profile
    source ~/.bash_profile
else
    if [ -f ~/.bash_aliases ]; then
        rm -i ~/.bash_aliases
    fi
    ln -s ~/dot/.bash_aliases ~/.bash_aliases
    if [ -f ~/.bashrc ]; then
        rm -i ~/.bashrc
    fi
    ln -s ~/dot/.bashrc ~/.bashrc
    source ~/.bashrc
fi

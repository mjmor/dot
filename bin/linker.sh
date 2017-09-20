# link vimrc
ln -fs ~/dot/.vimrc ~/.vimrc

# link bashrc or bash_profile depending on OS
SYSTYPE=`uname -s`
if [[ $SYSTYPE =~ ^Darwin ]]
then
    ln -fs ~/dot/.bash_aliases ~/.bash_aliases
    ln -fs ~/dot/.bashrc ~/.bashrc
    ln -fs ~/dot/.bash_profile ~/.bash_profile
    source ~/.bash_profile
else
    ln -fs ~/dot/.bash_aliases ~/.bash_aliases
    ln -fs ~/dot/.bashrc ~/.bashrc
    source ~/.bashrc
fi

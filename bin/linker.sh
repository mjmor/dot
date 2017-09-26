# link vimrc
ln -fs ~/dot/.vimrc ~/.vimrc
ln -fs ~/dot/.inputrc ~/.inputrc
ln -fs ~/dot/.always_forget.txt ~/.always_forget.txt

# link bashrc or bash_profile depending on OS
SYSTYPE=`uname -s`
if [[ $SYSTYPE =~ ^Darwin ]]; then
    ln -fs ~/dot/.bash_aliases ~/.bash_aliases
    ln -fs ~/dot/.bashrc ~/.bashrc
    ln -fs ~/dot/.bash_profile ~/.bash_profile
else
    ln -fs ~/dot/.bash_aliases ~/.bash_aliases
    ln -fs ~/dot/.bashrc ~/.bashrc
fi

# link bash completion scripts
ln -fs ~/dot/.bash_completion ~/.bash_completion

if [ ! -d ~/.bash_completion.d/ ]; then
    mkdir -p ~/.bash_completion.d/
fi

for bcfile in ~/dot/.bash_completion.d/* ; do
    echo $bcfile
    echo $(basename ${bcfile})
    ln -fs $bcfile ~/.bash_completion.d/$(basename ${bcfile})
done

if [[ $SYSTYPE =~ ^Darwin ]]; then
    source ~/.bash_profile
else
    source ~/.bashrc
fi

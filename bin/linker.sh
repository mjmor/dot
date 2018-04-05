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
    ln -fs ~/dot/.fico-gitconfig ~/.gitconfig
    ln -fs ~/dot/.skhdrc ~/.skhdrc
    ln -fs ~/dot/.chunkwmrc ~/.chunkwmrc
else
    ln -fs ~/dot/.bash_aliases ~/.bash_aliases
    ln -fs ~/dot/.bashrc ~/.bashrc
fi

ln -fs ~/dot/.gitignore ~/.gitignore

# link bash completion scripts
ln -fs ~/dot/.bash_completion ~/.bash_completion

if [ ! -d ~/.bash_completion.d/ ]; then
    mkdir -p ~/.bash_completion.d/
fi

for bcfile in ~/dot/.bash_completion.d/* ; do
    ln -fs $bcfile ~/.bash_completion.d/$(basename ${bcfile})
done

if [[ $SYSTYPE =~ ^Darwin ]]; then
    source ~/.bash_profile
else
    source ~/.bashrc
fi

# link all system configuration files
if [ -d /etc/X11/xorg.conf.d/ ]; then
    sudo ln -fs ~/dot/sys_config/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
fi

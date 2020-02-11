#!/bin/bash
echo Setting up the shell

export JPRO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
pushd $JPRO > /dev/null

#Pull sub-modules
git submodule update --init

. ./bin/function.sh
OSVer="$(getOsVer)"

#Link the configuration files to the root directory
cd ./configs
for f in .[a-zA-Z0-9]*; do 
    if [[ "${f}" != ".[a-zA-Z0-9]*" ]]; then
        mv ${HOME}/$f $HOME/$f-bak
        ln -s ${JPRO}/configs/$f ${HOME}/
    fi
done
for f in [a-zA-Z0-9]*; do 
    if [[ "${f}" != "[a-zA-Z0-9]*" ]]; then
        mv ${HOME}/$f $HOME/$f-bak
        ln -s ${JPRO}/configs/$f ${HOME}/
    fi
done
cd ..

# try and copy the WSL/MIN-tty config to the appropriate user.
# This assumes that the user name matches
if [ -f /mnt/c/Users/${USER}/AppData/Roaming/wsltty/config ] && 
    [ -f ${JPRO}/configs/.mintty ]; then
    mv /mnt/c/Users/jcarswell/AppData/Roaming/wsltty/config{,-bck}
    cp ${JPRO}/configs/.mintty /mnt/c/Users/${USER}/AppData/Roaming/wsltty/config
else
    echo "If you are using wsltty, please copy ~/.mintty to %appdata%/wsltty/config"
fi

# create the bashrc and bashprofile scripts to source the init script
cat <<EOF > ${HOME}/.bashrc
if [ -z "\${JPROF}" ]; then
  . ${JPRO}/init
fi
EOF

cat <<EOF > ${HOME}/.bash_profile
if [ -z "\${JPROF}" ]; then
  . ${JPRO}/init
fi
EOF

[ -d ${JPRO}/local ] || mkdir ${JPRO}/local && touch ${JPRO}/local/example.sh

# Auto install pre-req's (optional), if interactive
if [[ "$-" != *i* ]]; then
    ans="n"
else
    read -r -p "Do you want to install apps?[y/N] " ans
fi

if [[ "${ans}" == "y" ]] || [[ "${ans}" == "Y" ]]; then
    if [[ "${OSVer}" == "Ubuntu" ]] || [[ "${OSVer}" == "Debian" ]]; then
        sudo apt install golang-go
        for f in ./apps/*.deb; do
            if [[ "${f}" != "./apps/*.deb" ]]; then
                sudo dpkg -i $f
            fi
        done
    elif [[ "${OSVer}" == "cygwin" ]]; then
        echo "Installing packages is not supported at this time"
        echo "Please manually install golang-go and bat"
    elif [[ "${OSVer}" == "mac" ]]; then
        which -s brew 2&>1 /dev/null
        [[ "${?}" != "0" ]] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew install go --cross-compile-common
    fi
fi

which bat 2>&1 /dev/null

if [[ "${?}" != "0" ]]; then
    ln -s ${JPRO}/usr/share/bat/bat ${JPRO}/bin/bat
fi

popd > /dev/null

. ${HOME}/.bashrc

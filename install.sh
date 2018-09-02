echo Setting up the shell

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
pushd $DIR

. ./bin/functions.sh
OSVer="$(getOsVer)"

cd ./configs
for f in ./; do 
    mv ${HOME}/$f $HOME/$f-bak
    ln -s $f ${HOME}/
done

if [ -f /mnt/c/Users/jcarswell/AppData/Roaming/wsltty/config ]; then
    mv /mnt/c/Users/jcarswell/AppData/Roaming/wsltty/config{,-bck}
    cp configs/.mintty /mnt/c/Users/jcarswell/AppData/Roaming/wsltty/config
fi

cat <<EOF > ${HOME}/.bashrc
. ${DIR}/init
EOF

cat <<EOF > ${HOME}/.bash_profile
. ${DIR}/init
EOF

[ -d local ] || mkdir local

read -r -p "Do you want to install apps?[y/N] " ans

if [ "${ans}" == "y"] || [ "${ans}" == "Y" ]; then
    if [ "${OSVer}" == "Ubuntu" ] || [ "${OSVer}" == "Debian" ]; then
        sudo apt install golang-go
        for f in ./apps/*.deb; do sudo dpkg -i $f; done
    elif [ "${OSVer}" == "cygwin" ]; then
        echo "Installing packages is not supported at this time"
        echo "Please manually install golang-go"
    elif [ "${OSVer}" == "mac" ]; then
        which -s brew
        [[ "${?}" != "0" ]] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew install go --cross-compile-common
    fi
fi

popd

. ${HOME}/.bashrc

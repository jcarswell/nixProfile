lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

getOsVer(){
    if [ "${OSTYPE}" == "cygwin" ]; then
        OSVer="cygwin"
    elif [ "${OSTYPE}" == "darwin" ]; then
        OSVer="mac"
    elif [ "${OSTYPE}" == "linux-gnu" ]; then
       if [ -f /etc/redhat-release ] ; then
            OSVer=`cat /etc/redhat-release |sed s/\ release.*//`
        elif [ -f /etc/SuSE-release ] ; then
            OSVer='suse'
        elif [ -f /etc/mandrake-release ] ; then
            OSVer='mandrake'
        elif [ -f /etc/debian_version ] ; then
            OSVer=`cat /etc/lsb-release | grep '^DISTRIB_ID' | awk -F=  '{ print $2 }'`
        fi
    fi
    export OSVer
}

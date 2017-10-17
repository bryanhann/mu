if [ "$0:$1" == "./proxy.bash:install" ] ; then 
    export mu_cmdname=$3
    export mu_cmdpath=$2/$3
    export mu_cmddest=$PWD/$0

    echo Installation local MU.
    echo MU source is $mu_cmdpath
    echo MU target is $mu_cmddest
    echo Writing to target
    echo export    mu_cmdname=$mu_cmdname > $mu_cmdpath
    echo export    mu_cmdpath=$mu_cmdpath >> $mu_cmdpath
    echo export    mu_cmddest=$mu_cmddest >> $mu_cmdpath
    echo           $mu_cmddest \$\*       >> $mu_cmdpath
    echo Setting target permissions
    chmod 777 $mu_cmdpath
    echo Installation complete. 
    exit
fi

if [ "$0" == "./docs/proxy.bash" ] ; then 
    cat $0/../install-proxy.usage
    exit 
fi

if [ "$1" == "" ] ; then 
    $0/../scripts/help 
    exit
fi 

if [ "$1" == "help" ] ; then 
    $0/../scripts/help 
    exit
fi 

if [ ! -f $0/../scripts/$1 ] ; then
   $0/../scripts/help 
   exit 
fi

$0/../scripts/$*


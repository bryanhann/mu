##################################################################
# Confirm that this script was called from within its own 
# directory (not called from any other directory, and not
# sourced. This directory should NOT be on $PATH. 
##################################################################

if [ ! "$0" == "./install.sh" ]; then
    echo "Try \"./install.sh\" "
    exit
fi

##################################################################
# We want to determine the directory of this script to use it
# as the target of a symlink, but we may not yet consult $PWD.
# If by chance we entered the current directory via the link we 
# just removed then it is likely that current value of $PWD is 
# invalid. Doing "cd ." should restore $PWD to a valid value
# saving us from creating a symlink that refers to itself. 
#
# [XXX I tested it and it works on my current MacOS/bash setup, 
# but is it safe on all platforms/shells?  -- bhann@pobox.com]
##################################################################

cd .


##################################################################
# Now it is safe to define our constants
##################################################################

__MAGIC__=4999186371574026b8cc2a53b42f71e3
__LINK__=${HOME}/mu
__TARGET__=${PWD}
__BUFFER__=${HOME}/.tmp.$RANDOM.$RANDOM



##################################################################
# Reset the symlink
##################################################################

rm ${__LINK__} 2> /dev/null
echo "Linking [~/mu] to [$__TARGET__]."
ln -s $__TARGET__ ${__LINK__}


##################################################################
# Update the startup files (.profile, .bashrc, etc)
##################################################################

for ii in `ls -A -1 ${__TARGET__}/source | grep "^\."` ; do
    original=${HOME}/$ii
    cat $original | grep -v $__MAGIC__ > $__BUFFER__   
    echo source ${__LINK__}/source/dot$ii  $__MAGIC__  >> $__BUFFER__
    cat $__BUFFER__ > $original
    rm $__BUFFER__
    echo "Updating [~/$ii]; it will now source [$__LINK__/source/$ii]."
done


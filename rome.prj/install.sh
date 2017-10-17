##################################################################
# Confirm that this script was called from within its own 
# directory (not called from any other directory, and not
# sourced. This directory should NOT be on $PATH. 
##################################################################

if [ ! "$0" == "./install.sh" ]; then
    echo "Try \"./install.sh\" "
    exit
fi

export ROME=${HOME}/.rome
rm $ROME
rm ${HOME}/.profile
rm ${HOME}/.bashrc
ln -s $PWD/rome $ROME
ln -s $ROME/dot.profile $HOME/.profile
ln -s $ROME/dot.bashrc ~/.bashrc


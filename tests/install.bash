export sandbox=`mktemp -d $HOME/sandbox_XXX`
export PATH=$PATH:$sandbox
pushd $0/../..
./mu.bash install $sandbox poopy > $sandbox/devnul
popd
export foo=`poopy marco`
poopy where
[ "$foo" == "polo!" ] && echo pass || echo fail
rm -r $sandbox

export MU_DEPTH=$(( MU_DEPTH + 1 ))
function exit () {
    if [ "$MU_DEPTH" = "1" ]; then
        echo no no no
    else
        builtin exit
    fi
}




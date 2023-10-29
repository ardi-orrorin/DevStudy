#!/opt/homebrew/bin/bash

Test() {
    echo "함수실행"
}
TestParams(){
    echo "param1: ${1}, param2: ${2}"
    echo "paramAll: ${*}"
}

Test par
TestParams par1 par2 par3
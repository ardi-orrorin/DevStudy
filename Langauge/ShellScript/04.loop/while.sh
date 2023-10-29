#!/opt/homebrew/bin/bash

# while 조건이 참 일때 반복
# while [ 값1 조건 값2 ]
# do
#   실행문
# done


var=0
while [ $var -lt 5 ]
do
    echo $var
    var=`expr ${var} + 1`
done

echo
# until 조검이 참이 될때까지 반복
# until [ 값1 조건 값2 ]
# do
#   실행문
# done

var1=7
until [ $var1 -gt 10 ]
do
    echo $var1
    var1=`expr $var1 + 1`
done


#!/bin/bash

# getopts optString Variables 옵션처리
# getopts getopts의 확장 기능을 제공한다.
# getopt는 옵션에 대한 매개변수를 바로 입력해야하지만
# getopts는 옵션에 대한 매개변수를 자체대로 배칭시켜 처리한다.
# getopts ab:cd -a -b -c -d test  test의 매개변수는 -b에 적재된다.

while getopts ab:c: opt
do
    case "$opt" in
        a) echo "Found the -a Option";;
        b) echo "Found the -b Option with value $OPTARG";;
        c) echo "Found the -c Option";;
        *) echo "$opt Not Found Option";;
    esac
done

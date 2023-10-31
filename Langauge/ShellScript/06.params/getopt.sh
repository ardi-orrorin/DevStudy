#!/bin/bash

# getopt 옵션처리
# -a -d test 같은 옵션처리 명령어
# getopt optString parameters
# getops ab:cd -a -b test -c -d 와 같이 사용한다
# 매개변수가 필수로 들어가야하는 옵션인 경우 optString 에 :를 뭍여둔다. ex b:
# -- 까지 옵션처리로 인식한다.
# getopt -q 오류를 무시한다.
set -- $(getopt ab:cd $@)

echo "params : ${*}"

for param in "$@"
do
    echo "param : $param"
done

while [ -n "$1" ]
do
    echo "while $1"

    case "$1" in
    -a) echo "Found -a option" ;;
    -b) echo "Found -b option param=$2"
        shift ;;
    -c) echo "Found -c option" ;;
    -d) echo "Found -d option" ;;
    --) shift; break ;;
    *) echo "$1 Not Found option" ;;
    esac
    shift
done

# getopts optString Variables 옵션처리
# getopts getopts의 확장 기능을 제공한다.
# getopt는 옵션에 대한 매개변수를 바로 입력해야하지만
# getopts는 옵션에 대한 매개변수를 자체대로 배칭시켜 처리한다.
# getopts ab:cd -a -b -c -d test  test의 매개변수는 -b에 적재된다.


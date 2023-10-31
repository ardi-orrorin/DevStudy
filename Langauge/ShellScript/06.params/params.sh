#!/bin/bash


baseName=$0
echo baseName: $baseName

# 모든 매개변수 확인
paramsCount=$# # 갯수
params=$* #모든 내용 다른 표현 $@
echo paramsCount: $paramsCount
echo params: $params


# $* 와 $@ 차이점
# 문자열로써 처리시 *는 모든 매개변수를 하나의 문자열로 처리한다.
# 문자열로써 처리시 @는 각각 띄어씌기를 기준으로 구분하여 각각 문자열로 처리한다.
for var in "$*"
do echo "* : $var"
done

echo
for var in "$@"
do echo "@ : $var"
done

echo
# shift
# 입력 받은 매개변수를 이전 매개변수로 이동하는 키워드
# $2 의 값은 -> $1으로 $1 -> $0으로 이동한다.

echo "before shift : $*" # 1 2 3 4 5
shift 1
echo "after shift : $*" # 2 3 4 5



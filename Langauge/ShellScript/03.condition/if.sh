#!/bin/bash

# if 기본 문법
# if [ 값1 조건 값2 ] 대괄호 한쌍은 별도의 프로세서를 생성 후 결과를 얻는다.(대괄호 안 띄워쓰기 필수)
# if [[ 값1 조건 값2 ]] 대괄호 두쌍은 현재 실행중인 프로레서에서 결과를 얻는다.
# if [ 값1 조건 값2 ]
# then
#   참 실행문
# else 
#   거짓 실행문
# fi; 

if [ 1 -eq 1 ]
then 
    echo "1 -eq 1 yes"
else
    echo "1 -eq 1 no"
fi

# if 규칙

echo
# 비교 조건은 정수형과 문자형을 구분해야 한다.
if [ "good" -eq "good" ] # errer  good: integer expression expected
then echo "good -eq good yes"
else echo "good -eq good no"
fi

echo
if [ "good" == "good" ]
then echo good == good yes
else echo good == good no
fi

echo
# 다운 조건 elif [ 값2 조건 값2 ]
if [ "good" == "god" ]
then echo "good == god yes"
elif [ "god" == "good" ]
    then echo "god == good yes"
    else echo "god == good no"
fi

# 조건 종류
# 문자형 
# [==]: 문자열이 같으면 참
# [!=]: 문자열이 서로 다르면 참
# [<]: 문자열1 < 문자열2 문자열1이 문자열2보다 정렬이 선행하면 참
# [>]: 문자열1 > 문자열2 문자열1이 문자열2보다 정렬이 선행하지 않으면 차
# [-z]: 문자열 길이가 0이면 참
# [-n]: 문자열 길이가 0이 아니면 참

# 정수형
# [-eq]: 값 같으며 참 equal
# [-ne]: 값이 다르면 not equal
# [-gt]: 값1 > 값2 greater
# [-ge]: 값1 >= 값2 greater equal
# [-lt]: 값1 < 값2 little
# [-le]: 값1 <= 값2 little equal

# 두개 이상의 조건
# [-a]: && 연산과 동일 and 연산
# [-o]: || 연산과 동일 or 연산

# 파일형
# [-d]: 파일이 디렉토리면 참
# [-e]: 파일이 있으면 참
# [-r]: 파일이 심볼릭링크면 참
# [-s]: 파일이 읽기 가능하면 참
# [-w]: 파일이 쓰기 가능하면 참
# [-x]: 파일이 실행 가능하면 참
# [ file1 -nt file2 ]: file1이 file2보다 최신 파일이면 참
# [ file1 -ot file2 ]: file1이 file2보다 이전 파일이면 참
# [ file1 -ef file2 ]: file1이 file2랑 같으면 참
 
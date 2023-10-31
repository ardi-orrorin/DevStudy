#!/bin/bash


# read 글자를 입력 받는 명령어
echo -n "Enter Your Name: "
read name
echo "You are Name: $name"

# read -p 프롬프트를 생성
read -p "Enter Your Age: " age
echo "You are age: $age"

# $REPLY
# 입력 받은 마지막의 모든 데이터를 저장하는 변수
read -p "test: "
echo "test: $REPLY"

read -p "test1: "
echo "test1: $REPLY"

# -t 타임아웃 단위 초(second)
read -t 3 -p "3s after Timeout your text: " text
echo "text: $text"

# -s 입력 내용 화면 표시 하지 않기
# 데이터는 실제로 표시되지만, 글자색과 배경색을 갖게 해서 사용자 눈에만 안보이도록 처리하는 효과를 부여한다.
read -s -p "Enter Silent Input : " silent
echo "silent : $silent"

# 파일 읽기
count=1
cat standard.md | while read line
do
    echo "$count. $line"
    count=$[ $count + 1 ]
done
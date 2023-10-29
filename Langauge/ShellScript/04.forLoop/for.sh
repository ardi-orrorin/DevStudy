#!/opt/homebrew/bin/bash
#!/bin/bash 기본 버전


# For Loop 기본 구조
# for var in 배열
# do
#    실행문
# done


# 배열 forLoop
for num in 1 2 3 4 5 6
do
    echo ${num}
done

echo


# 변수를 이용 forLoop
varArr=(1 2 3 4 5 6)

for num in ${varArr[*]}
do
    echo ${num}
done



echo

# Range forLoop
for var in {1..5}
do
    echo ${var}
done

echo


# Range Increment forLoop (afeter bash version 4.0)
for var in {1..10..3}
do
    echo $var
done

echo


# Range Sequence forLoop (before bash version 3.0)
# $(seq start end) `seq start end`
for var in $(seq 3 5)
do
    echo $var
done

echo
for var in `seq 6 10`
do
    echo $var
done

# Range Sequnce Incremen
# $(seq start increment end) `seq start increment end`
echo
for var in $(seq 10 2 15)
do
    echo $var
done

echo
for var in `seq 6 2 10`
do
    echo $var
done

echo
# basic forLoop 증감 for문
for ((i=0; i<5; i++))
do
    echo $i
done

## csh에서만 지원하는 foreach문
# foreach i (1 2 3)
#     echo $i
# end


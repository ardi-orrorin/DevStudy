#!/bin/bash
# expr 수식을 처리하기 위한 명령어

var1=""
var2=3
var3=`expr $var1 || $var2`
echo $var3
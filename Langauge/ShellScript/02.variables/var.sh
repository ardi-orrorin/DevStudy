#!/bin/sh

# 변수(variable)

# 변수명=값 의 형식을 갖는다.
# 대입 연산자는 =를 사용한다.
# 대입 연산자 사이에 띄어쓰기 ' '를 사용할 수 없다.
# 타입 형식은 존재 하지 않는다.
# 변수명 대소문자를 구분한다.

var1=123
var2=hello
var3=world
var4='world' #'' 글자만 인식


# var라는 글자를 인식
echo var1 var2 var3 var  # var1 var2 var3 var 

#변수 사용 방법
#$변수명을 통해 사용가능
#${변수명} 사용가능

echo var : $var1 $var2 $var3 $var4 # var : 123 hello world world

var5="${var1}${var2}${var3}${var4}"

echo var5 : ${var5} # var5 : 123helloworldworld

# 변수 배열
varArr=("hello" "world" "!!!!" 1 2 3 4)

# 사용시 ${변수} 으로 사용해야 한다.
echo varArr:  ${varArr} # hello
echo varArr[0]: ${varArr[0]} # hello
echo varArr[*]: ${varArr[*]} # hello world !!!! 1 2 3 4
echo varArr[@]: ${varArr[@]} # hello world !!!! 1 2 3 4

varArr[3]="WOW!" # 타입 상관없이 변경 가능
echo varArr[*]: ${varArr[*]} # hello world !!!! WOWl! 2 3 4


#변수의값과 text을 같이 표시할 경우˜
echo $var11  # var11 변수의 값을 호출
echo ${var1}1 # var1 과 text 1값을 합해서 출력 

echo
# 명령의 실행 결과를 변수에 담을 때 `명령어` 감싼다.
cmd1=`ls`  
cmd2=`date` 
echo cmd1 : ${cmd1} # DB DevTool History.md IDE Langauge Other Platform Presentation Project README.md Resource draw.Drawio push.sh
echo cmd2 : ${cmd2} # 2023년 10월 29일 일요일 14시 21분 53초 KST

echo
# 명령의 실행 결과는 $(명령어)로도 사용가능
cmd3=$(ls)
cmd4=$(date)
echo cmd3: $cmd3 # DB DevTool History.md IDE Langauge Other Platform Presentation Project README.md Resource draw.Drawio push.sh
echo cmd4: $cmd4 # 2023년 10월 29일 일요일 14시 21분 53초 KST

echo
# 특수 변수 참조
# null 값 이란 var="" or var=빈값 상태를 의미

# ${var=text} : 변수 var의 사용하지 않은 경우만 text라는 문자열을 대입 후 반환한다.
echo var6text : ${var6=text} # text
echo var6 : ${var6} # text
var6=retext 
echo var6reText : ${var6=text1} # retext
echo var6re : ${var6} # retext

echo
# ${var:=text} var 미사용 혹은 null의 경우에만 text를 대입 후 반환한다.
echo var7text : ${var7:=text} # text
echo var7 : ${var7} # text
var7=""
echo var7reText : ${var7:=text1} # text1
echo var7re : ${var7} # tex1

echo
# ${var-text} var 사용하지 않은 경우만 text라는 문자열을 반환한다.
# =와 차이점은 -는 대입하지 않고 대체 값을 반환한다는 것이다.
echo var8text : ${var8-text} # text
echo var8 : ${var8} # ㄷ
var8=""
echo var8reText : ${var8-text1} #
echo var8re : ${var8} #

echo
# ${var:-text} var 사용하거나 null 경우만 text라는 문자열을 반환한다.
echo var9text : ${var9:-text} # text
echo var9 : ${var9} # 
var9=""
echo var9reText : ${var9:-text1} # text1
echo var9re : ${var9} #

echo
# ${var+text} var null값도 포함해서 이미 사용된 경우만 text라는 문자열을 반환한다.
echo var10text : ${var10+text} # 
echo var10 : ${var10} # 
var10=""
echo var10reText : ${var10+text1} # text1
echo var10re : ${var10} #

echo
# ${var+text} var null값이외에 이미 사용된 경우만 text라는 문자열을 반환한다.
echo var11text : ${var11:+text} # 
echo var11 : ${var11} # 
var11="text11"
echo var11reText : ${var11+text1} # text1
echo var11re : ${var11} # text11

echo
# eval 변수의 값을 변수의 이름으로 하는 키워드
foo="bar"
bar="success"

echo '$'$foo # $bar
eval echo '$'$foo # success


echo
# unset var 변수 제거 키워드
echo $bar # success
unset bar
echo $bar #

# readonly 변수를 읽기 전용으로 설정
readonly read="readonly"
echo $read # readonly
# read="modify" # errer


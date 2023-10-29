#!/opt/homebrew/bin/bash

# switch 기본 문법
# case 변수 in
#   조건,값 ) 실행문 ;;
#   조건,값 ) 실행문 ;;
# esac

drink="coffee"
case $drink in
    "beer") echo "맥주" ;;
    "coffee") echo "커피" ;;
    "juice") echo "주스" ;;
esac
## package.json

### package name
패키지 이름

### version
패키지 버전

### entry point
자바스크립트 실행 파일 진입점, 보통 마지막 mmodule.exports를 하는 파일을 지정

### test command
코드를 테스트할 때 인력할 명령어

### git repository
코드를 저장해둔 git 저장소 주소를 의미,

### keywords
npm 공식 홈페이지에서 패키지를 쉽게 찾을 수 있게 한다.

### license
패키지 라이선스


## NPM INSTALL

### vulnerability
npm은 패키지를 설치활 때 패키지에 있을 수 있는 취약점을 자동으로 검사한다. <br>
<br>
npm audit은 패키지의 알려진 취약점을 검사할 수 있는 명령어로, 패키지를 설치시 악성코드가 설치되었는지 확인 할 수 있다.<br>
npm audit fix 스스로 수정할 수 있는 취약점 코드를 알아서 수정해준다. (주기적으로 하는 것 추천)<br>


### --save
패키지를 설치 할 때 dependencies에 패키지 이름을 추가하는 옵션으로
npm@5부터 기본값으로 설정되어 있어 따로 입력하지 않아도 된다.

### --save-dev
개발용 패키지

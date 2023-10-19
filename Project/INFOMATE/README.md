# INFOMATE PROJECT

### Link
[BackEnd-SpringBoot](https://github.com/IMFOMATE/infomate_back) <-Link Github Repository<br/>
[FrontEnd-React]() <-Link Github Repository<br/>
[BackEnd-Kafka&MongoDB](https://github.com/yoosc89/INFOMATE_Kafka_MongoDB) <-Link Github Repository<br/>

<br>

<table>
   <tr>
      <td><img src="../../Resource/Logo/oracle.jpg" width=120 height=120></td>
      <td><img src="../../Resource/Logo/mongodb.jpg" width=120 height=120></td>
      <td><img src="../../Resource/Logo/java.jpg" width=120 height=120></td>
      <td><img src="../../Resource/Logo/springboot.jpg" width=120 height=120></td>
   </tr>
   <tr>
      <td><img src="../../Resource/Logo/html.jpg" width=120 height=120></td>
      <td><img src="../../Resource/Logo/css.jpg" width=120 height=120></td>
      <td><img src="../../Resource/Logo/react.jpg" width=120 height=120></td>
      <td><img src="../../Resource/Logo/kafka.jpg" width=120 height=120></td>
   </tr>
   <tr>
      <td><img src="../../Resource/Logo/intelij.jpg" width=120 height=120></td>
      <td><img src="../../Resource/Logo/vscode.jpg" width=120 height=120></td>
      <td><img src="../../Resource/Logo/figma.jpg" width=120 height=120></td>
      <td><img src="../../Resource/Logo/notion.jpg" width=120 height=120></td>
   </tr>
</table>

DB : Oracle, MongoDB <br>
Language : JAVA, JavaScript <br>
Markup Language : HTML, CSS <br>
Backend FrameWork : Spring Boot, Kafka <br>
FrontFramework : React <br>
Frontend Library : Sunediter, fullCalendar, jsTree <br>
IDE : IntelliJ <br>
OtherSoftware : DA#5, Figma <br>

<br>

# 프로젝트 참여 인원(6명)
### 1. 스케쥴관리(캘린더) - 유**
### 2. 회원정보 - 송**
### 3. 전자결재 - 주**
### 4. 쪽지/주소록 관리 - 이**
### 5. 조직도-인사관리 - 장**
### 6. 근태 관리,게시판 - 김**

<br>

# 프로젝트 개요
### 당신의 유연한 업무를 위한 그룹웨어 “인포메이트”

유연근무제를 도입했는데 업무관리가 걱정되신다구요?

그런 회사들을 위한 솔루션 **“인포메이트”**

인포메이트는 정확한 출퇴근관리와 빠르고 쉬운 전자 결재 

팀별 일정관리와 개인 일정 관리뿐만 아니라 회사 전체 일정관리 서비스를 제공합니다.

쉽고 효율적인 그룹웨어 **“인포메이트”** 지금 사용해보세요!


<br>


## 요구 사항 명세서 Notion (일부)
![](./presentation/notion01.jpg)

<br>

## UX / UI - FIGMA

### 스케쥴 관리(캘린더)
![](./presentation/fimga.jpg)

### 전체 내용
![](./presentation/figma_full.jpg)


<br>

# DB 모델링
![](./presentation/DBModel.png)

<br/>

# 캘린더 주요 기능
1. 캘린더 표시 여부에 따른 필터링
   1. 전사 일정
   2. 내가 속한 팀 일정
   3. 그 밖에 공개된 캘린더
2. 모달을 이용한 간략한 일정 정보   
   1. 주소 등록시 카카오맵 팝업창 전환   
   2. 수정 및 삭제 가능  
3. 일정등록
   1. 참석자 추가 가능 (직원 리스트에서 추가)
4. 캘린더 관리
   1. 내 캘린더
      1. 캘린더 추가 및 수정 삭제 가능
      2. 캘린서 표시될 순서 변경
      3. 캘린더 공개 여부 수정
   2. 관심 캘린더
      1. 내가 구독하고 있는 캘린더 표시 및 삭제
      2. 내가 공개한 캘린더를 구독하는 캘린더와 유저, 구독 승인 및 취소 기능
      3. 공개된 캘린더 리스트 통한 구독 승인 요청

<br/>
<br/>

# 실제 구현 화면
![](./presentation/cal9.jpg)
![](./presentation/cal1.jpg)
![](./presentation/cal2.jpg)
![](./presentation/cal3.jpg)
![](./presentation/cal4.jpg)
![](./presentation/cal5.jpg)
![](./presentation/cal6.jpg)
![](./presentation/cal7.jpg)
![](./presentation/cal8.jpg)


# 인상깊은 혹은 주요 코드들


## SpringBoot
![](./presentation/boot01.jpg)
![](./presentation/boot02.jpg)
![](./presentation/boot03.jpg)

## Front - React
![](./presentation/react01.jpg)
![](./presentation/react02.jpg)
![](./presentation/react03.jpg)
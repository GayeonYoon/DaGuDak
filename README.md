# DaGuDak [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fminho5200%2FDaGuDak&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)
웹 경마 사이트
- 기간 : 20. 10. 18 ~ 20. 11. 05
- 팀원 : 5명
- 개발툴 : eclipse IDE, Oracle sqldeveloper
- 주제 : Spring MVC 패턴을 사용한 Web 경마 사이트

&nbsp;&nbsp;&nbsp;

![image](mainImage.png)

&nbsp;&nbsp;&nbsp;

![image](racingImage.png)

&nbsp;&nbsp;&nbsp;

# Technologies
 - Java, JavaScript
 - Spring Framework
 - Oracle
 - WebSocket
 - MyBatis, DOM, jQuery, Json, AJAX 등

&nbsp;&nbsp;&nbsp;

# Project Structure
![image](structure.png)
- Spring MVC 패턴으로 Controller, Service, DAO, Model 구성
- JSP를 이용한 views
- Mybatis를 이용한 mappers

&nbsp;&nbsp;&nbsp;

# DB Modeling
![image](ERD.png)

&nbsp;&nbsp;&nbsp;

<details markdown = "1">
<summary>Race Tables</summary>

#### HORSE
 - 경주마의 정보를 저장합니다.
  
#### RACE
 - 경기 일정과 출전하는 경주마의 정보를 저장합니다.
 
#### MEMBER
 - 회원 정보를 저장합니다.
 
#### BETTING_LIST
 - 회원들이 경기에 베팅한 정보를 저장합니다.
   
</details>

&nbsp;&nbsp;&nbsp;

<details markdown = "1">
<summary>Board Tables</summary>

#### BOARD
 - 게시판 게시글 정보를 저장합니다.

#### COMMENTS
 - 게시글에 달린 댓글 정보를 저장합니다.
</details>


&nbsp;&nbsp;&nbsp;

# Summary


&nbsp;&nbsp;&nbsp;
## ✍️ ****Summary****

**기획 의도**
  - 단순한 CRUD 기능 외에 모두가 참여할 수 있고 즐길 수 있는 요소를 추가<br>
  - 다수의 클라이언트가 직접 참여할 수 있는 프로젝트<br>
  - Spring framework, JavaScript, WebSocket 등 다양한 기술 활용 목적<br>
    
**주요 기능**
<details markdown = "1">
<summary>회원 CRUD</summary>

![image](pptImages/1member.JPG)
 
</details>

<details markdown = "1">
<summary>이니시스 결제 시스템을 통한 포인트 충전</summary>

![image](pptImages/2point.JPG)
 
</details>

<details markdown = "1">
<summary>게시판 CRUD (게시글, 댓글)</summary>

![image](pptImages/3board.JPG)
 
</details>

<details markdown = "1">
<summary>네이버 뉴스검색API를 이용한 경마 뉴스 게시판</summary>

![image](pptImages/4boardAPI.JPG)
 
</details>

<details markdown = "1">
<summary>경주마 및 경기 CRUD</summary>

![image](pptImages/5horse.JPG)
 
</details>

<details markdown = "1">
<summary>베팅</summary>

![image](pptImages/6betting.JPG)
 
</details>

<details markdown = "1">
<summary>상금</summary>

![image](pptImages/7reward.JPG)
 
</details>

<details markdown = "1">
<summary>Javascript로 구현한 경마 게임</summary>

![image](pptImages/8racing.JPG)
 
</details>

<details markdown = "1">
<summary>WebSocket을 이용한 실시간 경기 및 채팅</summary>

![image](pptImages/9chatting.JPG)
 
</details>


## 🛠 사용 기술 및 라이브러리

- Java(jdk 1.8), JSP, MyBatis, Oracle
- Spring Framework, Eclipse
- HTML, CSS, JavaScript, jQuery , Json, Ajax, WebSocket

## 🖥 담당 기능

- 회원 가입, 로그인, 회원 정보 수정, 회원 탈퇴 기능 개발
- 로그인 상태의 경우에만 게임 참여, Betting 가능하도록 개발
- 비회원의 경우 경기 관람만 가능하도록 개발
- 쿠키를 이용한 아이디 기억하기 기능 개발
- 세션을 이용한 로그인 상태 유지

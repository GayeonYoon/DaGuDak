<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>

<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">RACING</span>
            <h2 class="mb-4">다 그 닥 경 마</h2>
         </div>
      </div>
   </div>
</section>

<style>
#track {
   width: 1102px;
   height: 650px;
   border: 3px black solid;
   align-content: center;
}

#gameBackground {
   /* width:  1110px; */
   width: 100%;
   height: 650px;
   margin-left: 10px;
   left: calc(50% - 560px);
   display: flex;
}

.horse1 {
   width: 120px;
   height: 100px;
   /* display: none; */
}

.horse2 {
   width: 140px;
   height: 140px;
}

.horse3 {
   width: 160px;
   height: 160px;
}

.horse4 {
   width: 180px;
   height: 180px;
}

.horse5 {
   width: 200px;
   height: 200px;
}

/* #ranking_1_horse, #ranking_2_horse, #ranking_3_horse, #ranking_4_horse,
   #ranking_5_horse {
   width: 40px;
   height: 40px;
} */

.verticalLine {
   border-right: thick solid #ff0000;
   width: 900px;
   height: 647px;
}

hr {
   position: relative;
   border: solid 2px black;
}

#timer {
   z-index: 40;
   position: absolute;
   left: 550px;
   top: 450px;
   width: 300px;
   text-align: center;
   color: white;
   font-size: 800;
   font-weight: 900;
   margin-left: -150px;
   margin-top: -50px;
}

.chatContainer {
   float: left;
   width: 75%;
   margin-left: 5px
}

#messageWindow {
   height: 400px;
    border: 1px solid lightgrey;
    overflow: auto;
    padding: 20px;
    border-radius: 5px;
    background: ghostwhite;
}

.notice {
    text-align: center;
    margin: 5px 0;
    color: firebrick;
}

#me {
    color: black;
    margin: 5px 0;
    width: auto;
}

#myMessage {
    background-color: #fc5e28;
    padding: 5px 10px;
    color: white;
    border-radius: 10px;
    margin-left: auto;
    width: fit-content;
    max-width: 50%;
    word-break: break-all;
}

#you {
   color: black;
    height: fit-content;
   width: -webkit-fill-available;
    display: -webkit-inline-box;
    margin: 10px 0;
}

#yourId {
    font-size: 15px;
    width: 100px;
    font-weight: bold;
    padding: 7px 0;
    word-break: break-all;
}

#yourMessage {
    width: fit-content;
    max-width: 50%;
    word-break: break-all;
    height: fit-content;
    text-align: left;
    background-color: blanchedalmond;
    padding: 5px 10px;
    border-radius: 10px;
    margin-left: 10px;
}

.inputContainer {
   margin: 20px 0;
    text-align: center;
    width: auto;
}

#inputMessage {
    width: 93%;
    font-size: 15px;
    padding: 5px 10px;
    border: lightgray solid 1px;
    border-radius: 5px;
}

.userList {
    float: right;
    width: 20%;
    text-align: center;
    margin-right: 3px;
    padding: 1% 0;
    border: 1px solid lightgray;
    height: 450px;
    border-radius: 5px;
    font-weight: bold;
    font-size: larger;
    color: black;
    background: ghostwhite;
}

#chatList {
   font-size: medium;
}

#chatList {
   font-size: medium;
   height: 350px;
   overflow: auto;
}
</style>

<!-- 출발 버튼 및 랭킹 -->
    <c:if test="${sessionScope.userId == 'admin' }">
   <!-- 출발 버튼 및 랭킹 -->
<div align="center" class="mt-3">
         <input type="button" onclick="start()" value=" 출발! >> " style="margin : 0px 0px 10px 10px; " class="btn btn-primary">
      </div>
    </c:if>

<!-- 게임 배경 -->
<script type="text/javascript" src="<c:url value="/resources/js/racing/animationParallxingBackground.js" />"></script>
<div id="gameBackground" style="position:relative;">
   
   <canvas id="GameCanvas" width="1100" height="650" style="border: 1px solid #000;">
      
   </canvas>
   <div id="track" style="position: absolute; top: 0; left:0;" >
   
      <!-- 랭킹 테이블 -->
   <table align="right" style="margin: 10px 10px 10px 10px; border: 1px solid black; width: 100px; color:black;">
         <tr><th colspan="2">RANKING</th><tr>
         <tr>
            <td>1등 :</td> 
            <td id=rank_1>0</td>
         </tr>
         <tr>
            <td>2등 :</td> 
            <td id=rank_2>0</td>
         </tr>
         <tr>
            <td>3등 :</td> 
            <td id=rank_3>0</td>   
         </tr>
         <tr>
            <td>4등 :</td> 
            <td id=rank_4>0</td>   
         </tr>
         <tr>
            <td>5등 :</td> 
            <td id=rank_5>0</td>
         </tr>
      </table>
            
      <!-- 타이머 출력 -->
      <h1 id="timer">READY</h1>
      
         <!-- 말 정보, 이미지 -->
      <div style="position:relative; left:10px; top:330px" id="img1"><img src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_${racingHorseList.first_Horse}.gif" class="horse1" id="race1" ></div>
      <div style="position:relative; left:10px; top:250px" id="img2"><img src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_${racingHorseList.second_Horse}.gif" class="horse2"  id="race2" ></div>
      <div style="position:relative; left:10px; top:140px" id="img3"><img src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_${racingHorseList.third_Horse}.gif" class="horse3"  id="race3" ></div>
      <div style="position:relative; left:10px; top:10px"  id="img4"><img src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_${racingHorseList.fourth_Horse}.gif" class="horse4"  id="race4" ></div>
      <div style="position:relative; left:10px; top:-120px" id="img5"><img src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_${racingHorseList.fifth_Horse}.gif" class="horse5"  id="race5" ></div>

</div>
</div>

<!-- 채팅 -->

<fieldset class="mt-5 mb-5">
   <div class="container">
      <!-- 채팅창 -->
      <div class="chatContainer">
         <div id="messageWindow" style=""></div>
         <div class="inputContainer">
            <input id="inputMessage" type="text" placeholder="채팅 내용을 입력하세요" onkeypress="enterKey(event)" />
            <input type="submit" value="send" class="btn btn-primary py-1 px-2" onclick="send()"/>
         </div>
      </div>
      <div class="userList">
         참가자 목록
         <hr style="border: solid 1px lightgray;">
         <div id="chatList" class="chatList-body"></div>
      </div>
   </div>
</fieldset>


<!-- music --> 
<div align="center" > 
<audio src="${pageContext.request.contextPath}/resources/music/music.mp3"  controls loop autoplay> </audio>

</div>



<c:if test = "${userId != null }">
   <script>
            var loginId = '${userId}';
         </script>
   </c:if>
   <c:if test = "${userId == null }">
   <script>
   var loginId = "익명";
   </script>
   </c:if>
 

   
   <!-- 출전마 정보 -->
<script type="text/javascript">
var webSocket = new WebSocket('ws://192.168.0.17:8089/DaGuDak/racing/' + loginId);
   /* 경기 출전할 말 리스트  -- RaceVO */
   var horseRoster = new Array(5); 
    horseRoster[0] = ${racingHorseList.first_Horse};
    horseRoster[1] = ${racingHorseList.second_Horse};
    horseRoster[2] = ${racingHorseList.third_Horse};
    horseRoster[3] = ${racingHorseList.fourth_Horse};
    horseRoster[4] = ${racingHorseList.fifth_Horse};

   /* 순위 */
   var first_place = ${racingHorseList.first_Place};
   var second_place = ${racingHorseList.second_Place};
   var third_place = ${racingHorseList.third_Place};
   var fourth_place;
   var fifth_place;
   
   /* 경기 종료 여부, 게임 번호 */
   var isEnd = '${racingHorseList.isEnd}';
   var race_no = ${racingHorseList.race_No};
   
   
   /* horse speed */
   var first_horse_speed = '${firstHorse}';
   var second_horse_speed = '${secondHorse}';
   var third_horse_speed = '${thirdHorse}';
   var fourth_horse_speed = '${fourthHorse}';
   var fifth_horse_speed = '${fifthHorse}';
   
   /* split horse speed */
   var firstHorseSpeed = new Array(4);
   var secondHorseSpeed = new Array(4);
   var thirdHorseSpeed = new Array(4);
   var fourthHorseSpeed = new Array(4);
   var fifthHorseSpeed = new Array(4);
   
  
   // 속도 분리 함수 호출
   substrHorseSpeed(firstHorseSpeed, first_horse_speed);
   substrHorseSpeed(secondHorseSpeed, second_horse_speed);
   substrHorseSpeed(thirdHorseSpeed, third_horse_speed);
   substrHorseSpeed(fourthHorseSpeed, fourth_horse_speed);
   substrHorseSpeed(fifthHorseSpeed, fifth_horse_speed);
   
   
   // 디비 속도 분리 함수
   function substrHorseSpeed(a, b){
      for(var i=0; i<a.length; i++){
         a[i] = b.substr(i,1);
         a[i] = Number(a[i]);
      } 
   }
   var player = new Array(5);
   player[0] = document.getElementById("img1");
   player[1] = document.getElementById("img2");
   player[2] = document.getElementById("img3");
   player[3] = document.getElementById("img4");
   player[4] = document.getElementById("img5");
   
   var rally = new Array(5); 
   
   var onlyNumCurrentLoc;
   
   var ranking = create2DArray(5,2);      /* // 2차원 배열 [ 말번호 , 현재위치 ] */
   // 2차원 배열 생성
   function create2DArray(rows, columns) {
       var arr = new Array(rows);
       for (var i = 0; i < rows; i++) {
           arr[i] = new Array(columns);
       }
       return arr;
   }
   
   var time = 4;
   var sec = "";
   
</script>
<script type="text/javascript" src="<c:url value="/resources/js/racing/race.js?version=8" />"></script>
<script src="<c:url value="/resources/js/chat/chat.js" />"></script> 
 
 <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
var rate = 3;

var user = new Array(5);
user[0] = "1번마";
user[1] = "2번마";
user[2] = "3번마";
user[3] = "4번마";
user[4] = "5번마";

var speed = new Array(5);
speed[0] = new Array(5);
speed[1] = new Array(5);
speed[2] = new Array(5);
speed[3] = new Array(5);
speed[4] = new Array(5);

rally[0] = 0;
rally[1] = 0;
rally[2] = 0;
rally[3] = 0;
rally[4] = 0;

// 화면 왼쪽에서 출발 1단계속도, 3/1 지점까지 2단계속도, 2/1 지점까지 3단계 속도, 나머지는 4단계 속도
var goal = 880; // 경기장 길이

// 각 지점
var goal1 = goal / 4;
var goal2 = goal / 2;
var goal3 = goal * 3 / 4;

var gage = 0; // 단계
var best = 0; // 제일 빠른놈
var j = 0;
var first = 0; // 1등

var rac = new Array(5);
var horse_no = new Array(5);
var jump = 0;

var winner = 0;

// 버튼누르면 출발함
function gogo() {
   // 각 단계별 속도를 지정함
   for (var i = 0; i < 5; i++) {
      for (var j = 0; j < 4; j++) {
         if (i == 0) {
            // 말 속도 능력치 + 구간 별 추가 랜덤 속도
            speed[i][j] = (firstHorseSpeed[j] / 10) + Math.random() * (0.1)
                  * (Math.random() < 0.5 ? -1 : 1);
         } else if (i == 1) {
            speed[i][j] = (secondHorseSpeed[j] / 10) + Math.random()
                  * (0.1) * (Math.random() < 0.5 ? -1 : 1);
         } else if (i == 2) {
            speed[i][j] = (thirdHorseSpeed[j] / 10) + Math.random() * (0.1)
                  * (Math.random() < 0.5 ? -1 : 1);
         } else if (i == 3) {
            speed[i][j] = (fourthHorseSpeed[j] / 10) + Math.random()
                  * (0.1) * (Math.random() < 0.5 ? -1 : 1);
         } else {
            speed[i][j] = (fifthHorseSpeed[j] / 10) + Math.random() * (0.1)
                  * (Math.random() < 0.5 ? -1 : 1);
         }

      }
   }
   race();
}

// 경기 진행
function race() {

   // 동물의 DIV

   // 말 이미지
   rac[0] = document.getElementById("race1");
   rac[1] = document.getElementById("race2");
   rac[2] = document.getElementById("race3");
   rac[3] = document.getElementById("race4");
   rac[4] = document.getElementById("race5");

   // 말 번호
   horse_no[0] = horseRoster[0]; // 1번열
   horse_no[1] = horseRoster[1]; // 2번열
   horse_no[2] = horseRoster[2]; // 3번열
   horse_no[3] = horseRoster[3]; // 4번열
   horse_no[4] = horseRoster[4]; // 5번열

   if (gage < goal) { // 결승선 통과를 안했다면
      // 단계별 속도변화 제일 빠른 동물 기준
      if (gage > goal1)
         j = 1;
      if (gage > goal2)
         j = 2;
      if (gage > goal3)
         j = 3;

      for (var i = 0; i < 5; i++) {
         // jump +=1
         rally[i] += speed[i][j];

         if (best < rally[i]) {
            best = rally[i]; // 젤빠른놈
            winner = i; // 1등 왜 있는거야?
         }

         // 현재 위치에 따라 표시
         // player[i] 말 번호에 따른 rally[i] 위치

         player[i].style.left = rally[i] + "px"; // 현재 위치
         webSocket.send("[rally]" + rally[i] + "//" + i);

         onlyNumCurrentLoc = rally[i];

         // 판정 기준 = 머리
         if (i == 0) {
            onlyNumCurrentLoc += 120;
         } else if (i == 1) {
            onlyNumCurrentLoc += 140;
         } else if (i == 2) {
            onlyNumCurrentLoc += 160;
         } else if (i == 3) {
            onlyNumCurrentLoc += 180;
         } else {
            onlyNumCurrentLoc += 200;
         }

         // 2차원 배열에 [말번호, 현재위치] 입력
         for (var k = 0; k < 2; k++) {
            if (k == 0) {
               ranking[i][k] = horseRoster[i] /* + "번마" */;
            } else {
               ranking[i][k] = onlyNumCurrentLoc;
            }
         }
      } // for

      // 현재위치 기준 내림차순 정렬 (2열 내림차순)
      ranking.sort(function(a, b) {
         return b[1] - a[1];
      });

      // 말 순위 출력
      // text ( 1 ~ 5 )
      document.getElementById("rank_1").innerHTML = ranking[0][0] + '번마';
      document.getElementById("rank_2").innerHTML = ranking[1][0] + '번마';
      document.getElementById("rank_3").innerHTML = ranking[2][0] + '번마';
      document.getElementById("rank_4").innerHTML = ranking[3][0] + '번마';
      document.getElementById("rank_5").innerHTML = ranking[4][0] + '번마';

      gage = best;
      setTimeout("race()", 20); // 시간 증가하면 말 이동 속도 느려져 게임 진행 시간 증가

   } else {
      // 경기 종료
      first_place = ranking[0][0];
      second_place = ranking[1][0];
      third_place = ranking[2][0];
      fourth_place = ranking[3][0];
      fifth_place = ranking[4][0];

      alert("1st : " + first_place + "번마" + "\n2nd : " + second_place + "번마"
            + "\n3rd : " + third_place + "번마");

      isEnd = 'Y';

      if (isEnd == "Y")
         updateRaceResult(isEnd);

      // 경기 종료 후 말 위치 카운트 초기화
      for (var i = 0; i < 5; i++) {
         rally[i] = 0;
         gage = 0;
         best = 0;
         document.getElementById("timer").innerHTML = "READY";
         document.getElementById("timer").style.display = "";

         // 현재 위치에 따라 표시
         player[i].style.left = rally[i] + "px"; // 현재 위치

      }
      
   }

}

// 2차원 배열 생성
function create2DArray(rows, columns) {
   var arr = new Array(rows);
   for (var i = 0; i < rows; i++) {
      arr[i] = new Array(columns);
   }
   return arr;
}

function start() { // 시작 버튼 연결

   // 타이머 시간 전송
   webSocket.send("[timer]" + time);

   // admin 타이머
   var timer = setInterval(function() {
      sec = time % 60 - 1;

      getTimer();
      time--;

      if (time == 0) {
         document.getElementById("timer").innerHTML = "START";
      } else if (time < 0) {
         clearInterval(timer);
         document.getElementById("timer").style.display = "none";
         gogo();
      }

   }, 1000);

   // 타이머 출력 함수
   function getTimer() {
      document.getElementById("timer").innerHTML = sec;
   }
}

// 경기 결과 업데이트 url
function updateRaceResult(isEnd) {
	
	webSocket.send("[hostGameEnd]" + race_no + "//" + isEnd + "//" + first_place+"//"+ second_place + "//" + third_place + "//" + fourth_place + "//" + fifth_place);
	  
   location.href = "/DaGuDak/race/updateRaceResult?race_no=" + race_no
         + "&isEnd=" + isEnd + "&first_place=" + first_place
         + "&second_place=" + second_place + "&third_place=" + third_place
         + "&fourth_place=" + fourth_place + "&fifth_place=" + fifth_place;

};

//강제 종료 url
function forceEnd(force_race_no, force_isEnd,force_first_place,force_second_place,force_third_place,force_fourth_place,force_fifth_place){
	location.href = "/DaGuDak/race/updateRaceResult?race_no=" + force_race_no
    + "&isEnd=" + force_isEnd + "&first_place=" + force_first_place
    + "&second_place=" + force_second_place + "&third_place=" + force_third_place
    + "&fourth_place=" + force_fourth_place + "&fifth_place=" + force_fifth_place;
}
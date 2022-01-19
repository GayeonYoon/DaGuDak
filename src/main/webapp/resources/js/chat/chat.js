var textarea = document.getElementById("messageWindow");
var chatList = document.getElementById("chatList");

var inputMessage = document.getElementById('inputMessage');

webSocket.onerror = function(event) {
   onError(event)
};
webSocket.onopen = function(event) {
   onOpen(event)
};
webSocket.onmessage = function(event) {
   onMessage(event)
};

function onOpen(event) {
   textarea.innerHTML += "<div class='notice'>채팅방에 입장하였습니다.</div>";
}

function onMessage(event) {
   var fromWebsocket = event.data;
   var userList = "";
   var valueFromWebSocket = "";
   var noticeMessage = "";
   var raceData = "";
   var rankData = "";
   var forceEndMessage = "";

   if (fromWebsocket.includes("[clients]")) {
      userList = fromWebsocket.replace("[clients]", "");
      ;
      chatList.innerHTML = userList;
   } else if (fromWebsocket.includes("[message]")) {
      valueFromWebSocket = fromWebsocket.replace("[message]", "");
      textarea.innerHTML += "<div  id='you'>" + valueFromWebSocket + "</div>";

   } else if (fromWebsocket.includes("[enter]")) {
      noticeMessage = fromWebsocket.replace("[enter]", "");
      textarea.innerHTML += "<div class='notice'>" + noticeMessage + "</div>";

   } else if (fromWebsocket.includes("[exit]")) {
      noticeMessage = fromWebsocket.replace("[exit]", "");
      textarea.innerHTML += "<div class='notice'>" + noticeMessage + "</div>";

   } else if (fromWebsocket.includes("[rally]")) {
      raceData = fromWebsocket.replace("[rally]", "");
      var rallyData = raceData.split("//");
      document.getElementById("timer").style.display = "none";
      var rallyy = rallyData[0];
      var ii = rallyData[1];

      player[ii].style.left = rallyy + "px";

      onlyNumCurrentLoc = rallyy

      // 판정 기준 = 머리
      if (ii == 0) {
         onlyNumCurrentLoc += 120;
      } else if (ii == 1) {
         onlyNumCurrentLoc += 140;
      } else if (ii == 2) {
         onlyNumCurrentLoc += 160;
      } else if (ii == 3) {
         onlyNumCurrentLoc += 180;
      } else {
         onlyNumCurrentLoc += 200;
      }

      for (var k = 0; k < 2; k++) {
         if (k == 0) {
            ranking[ii][k] = horseRoster[ii] /* + "번마" */;
         } else {
            ranking[ii][k] = onlyNumCurrentLoc;
         }
      }
      
      if (ii == 4) {
         ranking.sort(function(a, b) {
            return b[1] - a[1];
         });

         document.getElementById("rank_1").innerHTML = ranking[0][0] + '번마';
         document.getElementById("rank_2").innerHTML = ranking[1][0] + '번마';
         document.getElementById("rank_3").innerHTML = ranking[2][0] + '번마';
         document.getElementById("rank_4").innerHTML = ranking[3][0] + '번마';
         document.getElementById("rank_5").innerHTML = ranking[4][0] + '번마';
      }
   } else if (fromWebsocket.includes("[timer]")) {
      timeData = fromWebsocket.replace("[timer]", "");
      time = timeData;

      // client 타이머
      var timer = setInterval(function() {
         sec = time % 60 - 1;

         getTimer();
         time--;

         if (time == 0) {
            document.getElementById("timer").innerHTML = "START";
         } else if (time < 0) {
            clearInterval(timer);
            document.getElementById("timer").style.display = "none";
         }

      }, 1000);

      function getTimer() {
         document.getElementById("timer").innerHTML = sec;
      }

   }else if(fromWebsocket.includes("[hostGameEnd]")){
	   forceEndMessage = fromWebsocket.replace("[hostGameEnd]", "");
	   var forceEndData = forceEndMessage.split("//");
	   
	   forceEnd(forceEndData[0],forceEndData[1],forceEndData[2],forceEndData[3],forceEndData[4],forceEndData[5],forceEndData[6]);
   }
   textarea.scrollTop = textarea.scrollHeight;
   chatList.scrollTop = chatList.scrollHeight;
}

function onError(event) {
   alert(event.data);
}

function send() {
   textarea.innerHTML += "<div id='me'><div id='myMessage'>"
         + inputMessage.value + "</div></div>";
   textarea.scrollTop = textarea.scrollHeight;
   chatList.scrollTop = chatList.scrollHeight;
   webSocket.send(inputMessage.value);
   inputMessage.value = "";
}

function enterKey(e) {
   if (e.keyCode == 13) {
      send();
   }
}
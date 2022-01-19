//id 중복확인   ajax
function fn_idChk() {
   $.ajax({
            url : "/DaGuDak/member/idChk?member_id=" + $("#member_id").val(),
            type : "get",
            success : function(data) {

               var member_id = $("#member_id").val();
               var num = member_id.search(/[0-9]/g);

               if (data == 1) {
                  $("#chkID").css("color", "red");
                  $("#chkID").html("이미 사용중인 아이디입니다.");
                  $("#submit").attr("disabled", "disabled");

               } else if (data == 0 && member_id.length >= 8) {
                  $("#chkID").css("color", "green");
                  $("#chkID").html("사용가능한 아이디입니다.");
                  $("#submit").removeAttr("disabled");

                  if (member_id.search(/\s/) != -1) {
                     $("#chkID").css("color", "red");
                     document.getElementById('chkID').innerHTML = "아이디는 공백 없이 입력해주세요.";
                     $("#submit").attr("disabled", "disabled");
                     return false;
                  }
               } else if (member_id.length < 8) {
                  $("#chkID").css("color", "red");
                  document.getElementById('chkID').innerHTML = "8자리 이상 입력해주세요.";
                  $("#submit").attr("disabled", "disabled");
               } else if (member_id == null) {
                  $("#chkID").css("color", "red");
                  $("#chkID").html("아이디를 입력해주세요.");
                  $("#idChk").attr("value", "N");
                  $("#submit").attr("disabled", "disabled");
               }   else if (member_id.search(/\s/) != -1) {
                  $("#chkID").css("color", "red");
                  document.getElementById('chkID').innerHTML = "아이디는 공백 없이 입력해주세요.";
                  $("#submit").attr("disabled", "disabled");
                  return false;
               }
            }
         })
}

// 비밀번호 조건
function chkPW() {

   var pw = $("#password").val();
   var num = pw.search(/[0-9]/g);
   var eng = pw.search(/[a-z]/ig);
   var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

   if (pw.length < 8 || pw.length > 20) {
      $("#chkPW").css("color", "red");
      document.getElementById('chkPW').innerHTML = "8자리 ~ 20자리 이내로 입력해주세요.";
      $("#submit").attr("disabled", "disabled");

      return false;
   } else if (pw.search(/\s/) != -1) {
      $("#chkPW").css("color", "red");
      document.getElementById('chkPW').innerHTML = "비밀번호는 공백 없이 입력해주세요.";
      $("#submit").attr("disabled", "disabled");

      return false;
   } else if (num < 0 || eng < 0 || spe < 0) {
      $("#chkPW").css("color", "red");
      document.getElementById('chkPW').innerHTML = "영문,숫자, 특수문자를 혼합하여 입력해주세요.";
      $("#submit").attr("disabled", "disabled");

      return false;
   } else {
      $("#chkPW").css("color", "green");
      document.getElementById('chkPW').innerHTML = "사용가능한 비밀번호 입니다.";
      $("#submit").removeAttr("disabled");
      return true;
   }

}

// 비밀번호 맞는지 확인
function duplicatePW() {

   var pw1 = $("#password").val();
   var pw2 = $("#checkPassword").val();
   if (pw1 != pw2) {
      document.getElementById('passwordChecked').style.color = "red";
      document.getElementById('passwordChecked').innerHTML = "동일한 암호를 입력하세요.";
      $("#submit").attr("disabled", "disabled");
   } else if(pw1== pw2 && pw2.length > 8) {
      document.getElementById('passwordChecked').style.color = "green";
      document.getElementById('passwordChecked').innerHTML = "암호가 확인 되었습니다.";
      $("#submit").removeAttr("disabled");

   }

}

// 생년월일 확인
function checkBirth() {
   var birth = $('#birth').val();

   if (birth == '') {
      document.getElementById('checkBirth').style.color = "red";
      document.getElementById('checkBirth').innerHTML = "생년월일을 입력해주세요.";
      $("#submit").attr("disabled", "disabled");
   } else if (birth.length != 8) {
      document.getElementById('checkBirth').style.color = "red";
      document.getElementById('checkBirth').innerHTML = "생년월일을 정확히 입력해주세요. ex)19990101";
      $("#submit").attr("disabled", "disabled");
   } else if (birth.length == 8) {

      var date = new Date();
      var year = date.getFullYear();
      var month = (date.getMonth() + 1);
      var day = date.getDate();
      if (month < 10)
         month = '0' + month;
      if (day < 10)
         day = '0' + day;
      var monthDay = month + "" + day;
      birth = birth.replace('-', '').replace('-', '');
      var birthdayy = birth.substr(0, 4);
      var birthdaymd = birth.substr(4, 4);

      var age = monthDay < birthdaymd ? year - birthdayy - 1 : year
            - birthdayy;

      if (age > 19) {
         document.getElementById('checkBirth').style.color = "gray";
         document.getElementById('checkBirth').innerHTML = "성인입니다.";
         $("#submit").removeAttr("disabled");
      } else {
         document.getElementById('checkBirth').style.color = "red";
         document.getElementById('checkBirth').innerHTML = "성인이 아닙니다.";
         $("#submit").attr("disabled", "disabled");
      }

   
    function chkPW(){

       var pw = $("#password").val();
       var num = pw.search(/[0-9]/g);
       var eng = pw.search(/[a-z]/ig);
       var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

       if(pw.length < 8 || pw.length > 20){ 
         document.getElementById('chkPW').innerHTML = "8자리 ~ 20자리 이내로 입력해주세요.";
        return false;
       }else if(pw.search(/\s/) != -1){
        
         document.getElementById('chkPW').innerHTML = "비밀번호는 공백 없이 입력해주세요.";
        return false;
       }else if(num < 0 || eng < 0 || spe < 0 ){ 
        document.getElementById('chkPW').innerHTML = "영문,숫자, 특수문자를 혼합하여 입력해주세요.";
        return false;
       }else { 
          document.getElementById('chkPW').innerHTML = "사용가능합니다.";
          return true;
       }

      }
    
   // 비밀번호 맞는지 확인
    function duplicatePW(){
        
        var pw1 = $("#password").val();
        var pw2 = $("#checkPassword").val();
        if(pw1!=pw2){
         document.getElementById('passwordChecked').style.color = "red";
         document.getElementById('passwordChecked').innerHTML = "동일한 암호를 입력하세요.";
         $("#submit").attr("disabled", "disabled");
        }else{
         document.getElementById('passwordChecked').style.color = "black";
         document.getElementById('passwordChecked').innerHTML = "암호가 확인 되었습니다.";
         $("#submit").removeAttr("disabled");
         
        }
        
       }
    

    // 생년월일 확인
    function checkBirth(){
       var birth = $('#birth').val();
       
       if(birth ==''){
          document.getElementById('checkBirth').style.color = "red";
            document.getElementById('checkBirth').innerHTML = "생년월일을 입력해주세요.";
            $("#submit").attr("disabled", "disabled");
       }else if(birth.length!=8){
          document.getElementById('checkBirth').style.color = "red";
            document.getElementById('checkBirth').innerHTML = "생년월일을 정확히 입력해주세요. ex)19990101";
            $("#submit").attr("disabled", "disabled");
       }else if(birth.length==8){
       
          var date = new Date();
             var year = date.getFullYear();
             var month = (date.getMonth() + 1);
             var day = date.getDate();       
             if (month < 10) month = '0' + month;
             if (day < 10) day = '0' + day;
             var monthDay = month +"" + day;
             birth = birth.replace('-', '').replace('-', '');
             var birthdayy = birth.substr(0, 4);
             var birthdaymd = birth.substr(4, 4);
             
             var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
          
      
          if(age>19){
            document.getElementById('checkBirth').style.color = "gray";
            document.getElementById('checkBirth').innerHTML = "성인입니다.";
            $("#submit").removeAttr("disabled");
          }
          else{
             document.getElementById('checkBirth').style.color = "red";
               document.getElementById('checkBirth').innerHTML = "성인이 아닙니다.";
               $("#submit").attr("disabled", "disabled");
          }
       }
    }
   }}
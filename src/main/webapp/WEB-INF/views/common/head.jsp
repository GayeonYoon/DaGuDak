<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>

   <title>다그닥</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- head 옆 아이콘 -->
   <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/horse-3-32.ico"/>
   
   <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
   
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">
   
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

   <!-- 우리가 추가한 script -->
   <script src="http://code.jquery.com/jquery-1.9.0.js"></script>
   <script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
   
   <script src="<c:url value="/resources/js/board/list.js" />"></script>
   <script src="<c:url value="/resources/js/board/write.js" />"></script>
   <script src="<c:url value="/resources/js/board/update.js" />"></script>
   <script src="<c:url value="/resources/js/board/content.js" />"></script>
   
   <script type="text/javascript">
        $(document).ready(function () {
           var url = document.location.href.split("/");
          
          if (url.length == 5 || url[5] == "loginCheck") { //HOME
             $('#menu1').addClass("active");
          } else if (url.length >= 6) {
             if(url[4] == "board") {
                if(${sessionScope.bid == '1'}) {
                   $('#menu2').addClass("active");
                } else if (${sessionScope.bid == '2'}) {
                   $('#menu5').addClass("active");
                } else if (${sessionScope.bid == '3'}) {
                   $('#menu6').addClass("active");
                } else if (${sessionScope.bid == '4'}) {
                   $('#menu7').addClass("active");
                }
             } else if(url[4] == "race") {
                $('#menu3').addClass("active");
             } else if(url[4] == "horse") {
                $('#menu4').addClass("active");
             }
          }
        });
    </script> 


</head>
<body>
   <div class="py-1 top">
      <div class="container">
         <div class="row">
            <div class="col-sm text-center text-md-left mb-md-0 mb-2 pr-md-4 d-flex topper align-items-center">
               <p class="mb-0 w-100">
                  <span class="fa fa-paper-plane"></span>
                  <c:choose>
                   <c:when test= "${sessionScope.userId == null}">
                  <span class="text">로그인 후 이용해주십시오.</span>
                   </c:when>
                   <c:otherwise>
                      <span class="text">${sessionScope.userName} 님이 로그인 중입니다.</span>
                   </c:otherwise>
               </c:choose>
               </p>
            </div>
            
            <div class="col-sm-12 col-md-6 col-lg-7 d-flex topper align-items-center text-lg-right justify-content-end">
              <p class="mb-0 register-link"> 
               
               <c:choose>
               <c:when test= "${sessionScope.userId == null}">
               <!-- 로그아웃 상태 -->
              <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">로그인</a>
            </c:when>
            <c:otherwise>
               
               <!-- 로그인 일 때 -->
               <a href="${pageContext.request.contextPath}/member/checkPwd" class="btn btn-primary">포인트 충전</a>
               <a href="${pageContext.request.contextPath}/member/myPage" class="btn btn-primary">마이페이지</a>
               <a href="${pageContext.request.contextPath}/member/logout" class="btn btn-primary">로그아웃</a>
            </c:otherwise>
            </c:choose>
            </p>
            </div>
         </div>
      </div>
   </div>
   <div class="pt-4 pb-5">
      <div class="container">
         <div class="row d-flex align-items-start align-items-center px-3 px-md-0">
            <div class="col-md-4 d-flex mb-2 mb-md-0">
               <a class="navbar-brand d-flex align-items-center" href="/DaGuDak">
                  <span><img src="${pageContext.request.contextPath}/resources/images/gallop.gif" width="80px" height="50px"></span>
                  <span class="ml-2">다그닥 (Dagudak)<small><br>LUXURY ONILINE HORSE RACING</small></span>
               </a>
            </div>
            <a href="${pageContext.request.contextPath}/race/racing?race_no=0" style="margin-left: auto; width: auto;">
               <div class="pr-md-4 d-flex topper mb-md-1 align-items-center">
                  <div class="pr-md-2 text" style="width: auto; font-weight:bold; " >
                     <p class="con">
                        <span><b> [ 경기 바로가기 ] </b></span><br>
                        <span> 다그닥 다그닥! </span>
                     </p>
                  </div>
                  <div class="icon d-flex justify-content-center align-items-center">
                     <span class="fa fa-paper-plane"></span>
                  </div>
               </div>
            </a>
         </div>
      </div>
   </div>
    
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark ftco-navbar-light" id="ftco-navbar">
      <div class="container d-flex align-items-center">
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="fa fa-bars"></span> Menu
         </button>
         <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav mr-auto" style="width:100%; position:relative;">
            <!-- 6개까지. 7개 이상 쓰면 이상해짐 -->
            <!-- 페이지에 따라서  active 달라져야 함. js로.-->
               <li id="menu1" class="nav-item " style="width:15%;"><a href="${pageContext.request.contextPath}" class="nav-link" style="text-align:center; font-weight:bold;" >Home</a></li>
               <li id="menu2" class="nav-item " style="width:15%;"><a href="${pageContext.request.contextPath}/board/list?bid=1" class="nav-link" style="text-align:center; font-weight:bold" >공지사항</a></li>
               <li id="menu3" class="nav-item " style="width:15%;"><a href="${pageContext.request.contextPath}/race/racingList" class="nav-link" style="text-align:center; font-weight:bold" >오늘의 경기</a></li>
               <li id="menu4" class="nav-item " style="width:15%;"><a href="${pageContext.request.contextPath}/horse/horses" class="nav-link" style="text-align:center; font-weight:bold" >경주마 정보</a></li>
               <li id="menu5" class="nav-item " style="width:15%;"><a href="${pageContext.request.contextPath}/board/list?bid=2" class="nav-link" style="text-align:center; font-weight:bold" >경마 뉴스</a></li>
               <li id="menu6" class="nav-item " style="width:15%;"><a href="${pageContext.request.contextPath}/board/list?bid=3" class="nav-link" style="text-align:center; font-weight:bold" >익명게시판</a></li>
               <li id="menu7" class="nav-item " style="width:15%;"><a href="${pageContext.request.contextPath}/board/list?bid=4" class="nav-link" style="text-align:center; font-weight:bold"  " >고객센터</a></li>
            </ul>
         </div>
      </div>
   </nav>
   <!-- END nav -->
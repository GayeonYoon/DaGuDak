<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<footer class="ftco-footer">
   <div class="container mb-5 pb-4">
      <div class="row">
         <div class="col-lg col-md-6">
            <div class="ftco-footer-widget">
               <h2 class="ftco-heading-2 d-flex align-items-center">다그닥 사이트맵</h2>
               <p>
                  경마는 그닥...<br> <br>내 마음으로<br> <b>다그닥 다그닥♥</b>
               </p>
            </div>
         </div>
         <div class="col-lg col-md-6">
            <div class="ftco-footer-widget">
               <h2 class="ftco-heading-2">게시판</h2>
               <ul class="list-unstyled">
                  <li><a
                     href="${pageContext.request.contextPath}/board/list?bid=1"><span
                        class="fa fa-chevron-right mr-2"></span>공지사항</a></li>
                  <li><a
                     href="${pageContext.request.contextPath}/board/list?bid=3"><span
                        class="fa fa-chevron-right mr-2"></span>익명게시판</a></li>
                  <li><a
                     href="${pageContext.request.contextPath}/board/list?bid=2"><span
                        class="fa fa-chevron-right mr-2"></span>관련 뉴스</a></li>
               </ul>
            </div>
         </div>
         <div class="col-lg col-md-6">
            <div class="ftco-footer-widget">
               <h2 class="ftco-heading-2">경마</h2>
               <ul class="list-unstyled">
                  <li><a
                     href="${pageContext.request.contextPath}/race/racingList"><span
                        class="fa fa-chevron-right mr-2"></span>오늘의 경기</a></li>
                  <li><a href="${pageContext.request.contextPath}/race/racing?race_no=0"><span
                        class="fa fa-chevron-right mr-2"></span>경기 바로가기</a></li>
                  <li><a href="${pageContext.request.contextPath}/horse/horses"><span
                        class="fa fa-chevron-right mr-2"></span>경주마 정보</a></li>
               </ul>
            </div>
         </div>
         
               <div class="col-lg col-md-6">
                  <div class="ftco-footer-widget">
                     <h2 class="ftco-heading-2">마이페이지</h2>
                     <ul class="list-unstyled">
                        <c:if test ="${sessionScope.userId != null }">
                        <li><a
                           href="${pageContext.request.contextPath}/member/myPage"><span
                              class="fa fa-chevron-right mr-2"></span>내 정보 수정</a></li>
                        <li><a
                           href="${pageContext.request.contextPath}/member/checkPwd"><span
                              class="fa fa-chevron-right mr-2"></span>포인트 충전</a></li>
                        </c:if>
                        <c:if test = "${sessionScope.userId ==null }">
                        <li><a
                           href="#" data-toggle="modal" data-target="#exampleModalCenter"><span
                              class="fa fa-chevron-right mr-2" ></span>내 정보 수정</a></li>
                        <li><a
                           href="#" data-toggle="modal" data-target="#exampleModalCenter"><span
                              class="fa fa-chevron-right mr-2"></span>포인트 충전</a></li>
                        <li><a
                           href="#" data-toggle="modal" data-target="#exampleModalCenter"><span
                              class="fa fa-chevron-right mr-2"></span>베팅 히스토리</a></li>
                        </c:if>
                     </ul>
                  </div>
               </div>

         <div class="col-lg col-md-6">
            <div class="ftco-footer-widget">
               <h2 class="ftco-heading-2">고객센터</h2>
               <div class="block-23 mb-3">
                  <ul>
                     <li><a
                        href="${pageContext.request.contextPath}/board/list?bid=4"><span
                           class="fa fa-chevron-right mr-2"></span>FAQ</a></li> 
                     <li><a href="#"><span class="fa fa-phone mr-3"></span><span
                           class="text">02) 1234 5678</span></a></li>
                     <li><a href="#"><span class="fa fa-paper-plane mr-3"></span><span
                           class="text">dagudak@dagudak.com</span></a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="container-fluid bg-primary">
      <div class="container">
         <div class="row">
            <div class="col-md-6 aside-stretch py-3">

               <p class="mb-0">
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  Copyright &copy;
                  <script>
                     document.write(new Date().getFullYear());
                  </script>
                  All rights reserved | This template is made with <i
                     class="fa fa-heart" aria-hidden="true"></i> by <a
                     href="https://colorlib.com" target="_blank">Colorlib</a>
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
               </p>
            </div>
         </div>
      </div>
   </div>
</footer>

<div class="modal fade" id="exampleModalCenter" tabindex="-1"
   role="dialog" aria-labelledby="exampleModalCenterTitle"
   aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered" role="document">
      <!-- 로그인 모달창 -->
      <div class="modal-content">
         <div class="modal-header">
            <!-- 닫기 버튼 -->
            <button type="button"
               class="close d-flex align-items-center justify-content-center"
               data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true" class="fa fa-close"></span>
            </button>
         </div>

         <div class="modal-body p-4 p-md-5">
            <!-- 로그인 form -->
            <form name="loginForm"
               action="${pageContext.request.contextPath}/member/loginCheck"
               class="appointment-form ftco-animate" method="post">
               <h3>
                  <span style="align-content: center;">로그인</span>
               </h3>
               <div class="">
                  <div class="form-group">
                     <input type="text" name="member_id" id="remember_id"
                        class="form-control" placeholder="아이디"
                        onkeyup="javascript:keyevent(this);">
                  </div>
                  <div class="form-group">
                     <input type="password" name="password" id="password"
                        class="form-control" placeholder="비밀번호"
                        onkeyup="javascript:keyevent(this);">
                  </div>
                  <div>
                     <input type="checkbox" id="idSaveCheck"> 아이디 기억하기

                  </div>

                  <div class="form-group">
                     <input type="submit" id="submit" onclick="login()"
                        class="btn btn-primary py-3 px-4" value="로그인">
                  </div>
               </div>

            </form>

            <!-- 로그인 form 끝 -->

            <!-- 위 아래 둘중 선택 -->
            <div style="margin: auto; width: 70%;" class="ftco-animate">
               <span>아이디가 없으신가요? <a
                  href="${pageContext.request.contextPath}/member/register">
                     회원가입</a></span>
            </div>

         </div>
      </div>
   </div>
</div>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
   <svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
         stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none"
         stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>

<script src="<c:url value="/resources/js/member/cookie.js" />"></script>
<script src="<c:url value="/resources/js/member/login.js" />"></script>
<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
<script
   src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js" />"></script>
<script src="<c:url value="/resources/js/popper.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.easing.1.3.js" />"></script>
<script src="<c:url value="/resources/js/jquery.waypoints.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.stellar.min.js" />"></script>
<script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
<script
   src="<c:url value="/resources/js/jquery.magnific-popup.min.js" />"></script>
<script
   src="<c:url value="/resources/js/jquery.animateNumber.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-datepicker.js" />"></script>
<script src="<c:url value="/resources/js/jquery.timepicker.min.js" />"></script>
<script src="<c:url value="/resources/js/scrollax.min.js" />"></script>
<script src="<c:url value="/resources/js/main.js" />"></script>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>

</body>
</html>
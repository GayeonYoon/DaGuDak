<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file = "/WEB-INF/views/common/head.jsp" %>
  <section class="ftco-section contact-section ftco-no-pb" id="contact-section">
      <div class="container">
         <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
               <span class="subheading">Welcome!</span>
               <h2 class="mb-4">회원가입 완료</h2>
             <h3 class="mb-4">   ${member_id}님 환영합니다. </h3>
            </div>  
         </div>
         
         <!-- 회원가입 후 메인 , 로그인 버튼 -->
                 <div align="center" style="margin-bottom: 200px;">
       			 <a href="${pageContext.request.contextPath}" class="btn btn-dark"> 메인 페이지 가기 </a> 
       			    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">로그인</a></p>  
       			 </div>
       	 	     
       	 	     
       	 	     
       <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document"> 
         <!-- 로그인 모달창 -->
            <div class="modal-content">
               <div class="modal-header">
                  <!-- 닫기 버튼 -->
                  <button type="button" class="close d-flex align-items-center justify-content-center" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true" class="fa fa-close"></span>
                  </button>
               </div>
               <div class="modal-body p-4 p-md-5">
               <!-- 로그인 form -->
                    <form name="loginForm" action="${pageContext.request.contextPath}/member/loginCheck" class="appointment-form ftco-animate" method="post">
                     <h3><span style="align-content: center;">로그인</span></h3>
                     <div class="">
                        <div class="form-group">
                           <input type="text" name="loginId" id="loginId" class="form-control" placeholder="아이디" onkeyup="javascript:keyevent(this);">
                        </div> 
                         <div class="form-group">
                           <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호" onkeyup="javascript:keyevent(this);">
                        </div>
                        
                        <div>
                            <input type="checkbox" id="idSaveCheck"> 아이디 기억하기
                         
                        </div>
                      
                        <div class="form-group">
                           <input type="submit" id="submit" onclick="login()" class="btn btn-primary py-3 px-4" value="로그인">
                        </div>
                     </div> 
                  </form>
                  <!-- 로그인 form 끝 -->
                  
                  <!-- 회원가입 -->
                  <div style="margin: auto; width: 70%;" class="ftco-animate">
                         <span>아이디가 없으신가요? <a href="${pageContext.request.contextPath}/member/register"> 회원가입</a></span>
                  </div>
                  
               </div>
            </div> 
         </div>
      </div>
    </div>   
 </section>
    <script src="<c:url value="/resources/js/member/login.js" />"></script>
       <script src="<c:url value="/resources/js/member/cookie.js" />"></script>
       
       <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
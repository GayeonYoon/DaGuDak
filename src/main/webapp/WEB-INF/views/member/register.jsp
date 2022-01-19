<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file = "/WEB-INF/views/common/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center mb-5 pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">SIGN UP</span>
            <h2 class="mb-4">회 원 가 입</h2>
            <p>포인트를 충전하면 경기 관람 전 베팅이 가능합니다!</p>
         </div>
      </div>

      <div class="row block-15" style="margin: auto; margin-bottom: 50px; width: 50%;">

         <!-- 회원가입 form -->
         <form method="post" id="regForm" action="${pageContext.request.contextPath}/member/register"
            class="p-4 p-md-5 contact-form">
            <div class="row">
               <div class="col-md-11">
                  <div class="form-group">
                  <label for="id">아이디</label> 
                     <input type="text" name="member_id" id="member_id" onkeyup="fn_idChk()" class="form-control" placeholder="아이디" required style="float: left;">
                       <div id="chkID"></div>
                  </div>
               </div>
 
               <div class="col-md-11">
                  <div class="form-group">
                  <label for=password>비밀번호</label> 
                     <input type="password" name="password" id="password"
                        class="form-control" placeholder="비밀번호"  onkeyup="chkPW()" required>
                       <div id="chkPW"></div>
                  </div>
               </div>
               
               <div class="col-md-11">
                  <div class="form-group">
                  <label for=checkPassword>비밀번호 확인</label> 
                     <input type="password" name="checkPassword" id="checkPassword"
                        class="form-control" onkeyup="duplicatePW()" placeholder="비밀번호 확인" required>
                     <div id="passwordChecked"></div>
                  </div>
               </div>

               <div class="col-md-11">
                  <div class="form-group">
                  <label for="name">이름</label> 
                     <input type="text" name="name" class="form-control" placeholder="이름" required>
                  </div>
               </div>
 
               <div class="col-md-11">
                  <div class="form-group">
                     <label for=checkBirth>생년월일</label> 
                        <input type="text" name="birth" id="birth" class="form-control" onkeyup="checkBirth()" placeholder="생년월일 ex)19990101" required>
                     <div id="checkBirth"></div> 
                  </div>
               </div>

               <div class="col-md-11">
                  <div class="form-group">
                     <label for=checkBirth>이메일 ('@'를 포함해 주세요.)</label> 
                        <input type="email" name="email" class="form-control" placeholder="이메일" required>
                  </div>
                 </div>
          
               <div class="col-md-11">
                  <div class="form-group">
                     <label for=checkBirth>전화번호 ('-'없이 입력하세요.)</label> 
                        <input type="tel" name="phone" class="form-control" placeholder="전화번호" required>
                  </div>
                </div>
               <!-- div row 끝 -->
                
               
                <div style="margin-left: auto;  margin-right: auto; margin-top: 20px;">
                  <input type="submit" class="btn btn-success" id="submit" disabled="disabled" value="회원가입">
                  <button class="cencle btn btn-danger" type="reset" >취소하기</button>
               </div>
                
             </div>
         </form>

      </div>
   </div>
</section>

<script src="<c:url value="/resources/js/member/register.js" />"></script>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
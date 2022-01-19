<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>

<section class="hero-wrap js-fullheight"
   style="background-image: url('${pageContext.request.contextPath}/resources/images/running1.jpg');"
   data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <c:if test = "${loginResult eq '비밀번호 문제' }">
   <script>
   alert("비밀번호가 맞지 않습니다.");
   </script>
   </c:if>
   <c:if test = "${loginResult eq '아이디 문제' }">
   <script>
   alert("아이디가 존재하지 않습니다.");
   </script>
   </c:if>
    <c:if test = "${loginResult eq '성공' }">
   <script>
   alert("반갑습니다.");
   </script>
   </c:if>
   <c:if test = "${chargePoint  eq '성공' }">
   <script>
   alert("충전이 완료 되었습니다.");
   </script>
   </c:if>
   <c:if test = "${deleteMessage eq '성공'}">
   <script>
   alert("잘가요..");
   </script>
  </c:if>
   
 
   <div class="container">
      <div
         class="row no-gutters slider-text js-fullheight align-items-center"
         data-scrollax-parent="true">
         <div class="col-lg-6 ftco-animate">
            <div class="mt-5">
               <h1 class="mb-4">
                  지금까지 <br>이런 경마는 없었다
               </h1>
               <p class="mb-4"><!-- 어쩌고저쩌고 --></p>
               <p>
                  <a href="${pageContext.request.contextPath}/race/racing?race_no=0"
                     class="btn btn-primary">경기 바로가기</a>
                  <a href="${pageContext.request.contextPath}/horse/horses"   class="btn btn-white" >경주마 정보</a>
               </p>
            </div>
         </div>
      </div>
   </div>
</section>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
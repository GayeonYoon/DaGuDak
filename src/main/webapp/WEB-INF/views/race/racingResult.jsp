<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file = "/WEB-INF/views/common/head.jsp" %>
   
<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">RACING RESULT</span>
            <h2 class="mb-4">경기 결과</h2>
         </div>
      </div>
   </div>
</section>

<section class="ftco-section bg-light">

   <div class="container">
      <div class="row d-flex">
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${result.first_Place }" class="block-20"
                  style="background-image: url('/DaGuDak/resources/images/racing/horses/horse_${result.first_Place }.gif');">
               </a>
               <div class="text d-block">
                  <div class="meta">
                     <p>
                        <a href="#">
                        <span class="fa fa-calendar mr-2"></span>
                        ${result.race_Date }</a>
                        <a href="#" class="meta-chat">/ ${result.race_No }번째 경기</a>
                     </p>
                  </div>
                  <h3 class="heading" align="center">
                     <a href="#"> <span style="color: gold;" ><b>1등</b></span><br><b>${result.first_Horse_Name} </b>
                     <br><span class="fa fa-comment mr-2"></span>베팅누적금액: ${firstHorseTotalBettingPoint} P<!-- 추후에 베팅 테이블 완성 이후  -->
                     </a>
                  </h3>
                  <p align="center">
                     <a href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${result.first_Place }" class="btn btn-secondary py-2 px-3">상세 정보</a>
                  </p>
               </div>
            </div>
         </div>

         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${result.second_Place }" class="block-20"
                  style="background-image: url('/DaGuDak/resources/images/racing/horses/horse_${result.second_Place }.gif');">
               </a>
               <div class="text d-block">
                  <div class="meta">
                     <p>
                        <a href="#">
                        <span class="fa fa-calendar mr-2"></span>
                        ${result.race_Date }</a>
                        <a href="#" class="meta-chat">/ ${result.race_No }번째 경기</a>
                     </p>
                  </div>
                  <h3 class="heading" align="center">
                     <a href="#"><span style="color: silver;" ><b>2등</b></span><br>${result.second_Horse_Name }
                     <br><span class="fa fa-comment mr-2"></span>베팅누적금액: ${secondHorseTotalBettingPoint} P
                     </a>
                  </h3>
                  <p align="center">
                     <a href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${result.second_Place }" class="btn btn-secondary py-2 px-3">상세 정보</a>
                  </p>
               </div>
            </div>
         </div>
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${result.third_Place }" class="block-20"
                  style="background-image: url('/DaGuDak/resources/images/racing/horses/horse_${result.third_Place }.gif');">
               </a>
               <div class="text d-block">
                  <div class="meta">
                     <p>
                        <a href="#">
                        <span class="fa fa-calendar mr-2"></span>
                        ${result.race_Date }</a>
                        <a href="#" class="meta-chat">/ ${result.race_No }번째 경기</a>
                     </p>
                  </div>
                  <h3 class="heading" align="center">
                     <a href="#"><span style="color: brown;" ><b>3등</b></span><br>${result.third_Horse_Name}<br>
                     <span class="fa fa-comment mr-2"></span>베팅누적금액: ${thirdHorseTotalBettingPoint } P
                     </a>
                  </h3>
                  <p align="center">
                     <a href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${result.third_Place }" class="btn btn-secondary py-2 px-3">상세 정보</a>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
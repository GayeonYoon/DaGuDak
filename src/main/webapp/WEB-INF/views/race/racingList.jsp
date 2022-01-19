<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file = "/WEB-INF/views/common/head.jsp" %>
   
<script>
function goToRacing(race_no) {
   location.href="/DaGuDak/race/racing?race_no="+race_no;   
};
</script>


<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">RACING LIST</span>
            <h2 class="mb-4">오늘의 경기</h2>
         </div>
      </div>
   </div>
</section>

<section class="ftco-section bg-light">

   <div class="container">
      <div class="row d-flex">
         <!-- 경기중 -->
 <c:forEach var="race" items="${list }">
  <c:if test = "${race.isEnd == 'ING'}">
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a href="javascript:goToRacing(${race.race_No})" class="block-20"
                  style="background-image: url('${pageContext.request.contextPath}/resources/images/racing/state/list_ing.jpg');">
               </a>
               <div class="text d-block">
                  <div class="meta">
                     <p>
                  <!-- 경기내용 -->      <a href="#"><span class="fa fa-calendar mr-2"></span>
                        ${race.race_Date }
                        </a>
                     </p>
                  </div>
                  <h3 class="heading">
                     <a href="#">${race.race_No } 번째 경기</a>
                  </h3>
                  <h4>출전 말</h4>
                  <h5>${race.first_Horse } , ${race.second_Horse }, ${race.third_Horse }, ${race.fourth_Horse }, ${race.fifth_Horse }</h5>
                  <p>
                     <a href="javascript:goToRacing(${race.race_No})" class="btn btn-secondary py-2 px-3">경기 보기</a>
                         <a href="${pageContext.request.contextPath}/bet/bettingHistory?race_No=${race.race_No }" class="btn btn-secondary py-2 px-3">베팅 현황</a>
                  </p>
               </div>
            </div>
         </div>
</c:if>
 
 
         <!-- 경기임박 -->
 <c:if test = "${race.isEnd == 'SOON'}">
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a href="javascript:goToRacing(${race.race_No})" class="block-20"
                  style="background-image: url('${pageContext.request.contextPath}/resources/images/racing/state/list_start.jpg');">
               </a>
               <div class="text d-block">
                  <div class="meta">
                     <p>
                  <!-- 경기내용 -->      <a href="#"><span class="fa fa-calendar mr-2"></span>
                        ${race.race_Date }
                        </a>
                     </p>
                  </div>
                  <h3 class="heading">
                     <a href="#">${race.race_No } 번째 경기</a>
                  </h3>
                  <h4>출전 말</h4>
                  <h5>${race.first_Horse } , ${race.second_Horse }, ${race.third_Horse }, ${race.fourth_Horse }, ${race.fifth_Horse }</h5>
                  <p>
                  <c:if test= "${sessionScope.userId == 'admin'}">
                        <a href="javascript:goToRacing(${race.race_No})" class="btn btn-secondary py-2 px-3">경기시작</a>
                     </c:if>
                     <c:if test= "${sessionScope.userId != 'admin'}">
                        <a href="javascript:goToRacing(${race.race_No})" class="btn btn-secondary py-2 px-3">입장하기</a>
                     </c:if>
                  <!-- betting -->   
                  <a href="${pageContext.request.contextPath}/bet/betting?race_No=${race.race_No }&first_Horse=${race.first_Horse }&second_Horse=${race.second_Horse }&third_Horse=${race.third_Horse }&fourth_Horse=${race.fourth_Horse }&fifth_Horse=${race.fifth_Horse }" class="btn btn-secondary py-2 px-3">베팅 하기</a>
                  <a href="${pageContext.request.contextPath}/bet/bettingHistory?race_No=${race.race_No }" class="btn btn-secondary py-2 px-3">베팅 현황</a>
                  </p>
               </div>
            </div>
         </div>
         </c:if>
         <!--  대기중  -->
          <c:if test = "${race.isEnd == 'N'}">
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a href="#" class="block-20"
                  style="background-image: url('${pageContext.request.contextPath}/resources/images/racing/state/list_waiting.jpg');">
               </a>
               <div class="text d-block">
                  <div class="meta">
                     <p>
                  <!-- 경기내용 -->      <a href="#"><span class="fa fa-calendar mr-2"></span>
                        ${race.race_Date }
                        </a>
                     </p>
                  </div>
                  <h3 class="heading">
                     <a href="#">${race.race_No } 번째 경기</a>
                  </h3>
                  <h4>출전 말</h4>
                  <h5>${race.first_Horse } , ${race.second_Horse }, ${race.third_Horse }, ${race.fourth_Horse }, ${race.fifth_Horse }</h5>
                  <p>
                  <!-- betting -->   
                  <a href="${pageContext.request.contextPath}/bet/betting?race_No=${race.race_No }&first_Horse=${race.first_Horse }&second_Horse=${race.second_Horse }&third_Horse=${race.third_Horse }&fourth_Horse=${race.fourth_Horse }&fifth_Horse=${race.fifth_Horse }" class="btn btn-secondary py-2 px-3">베팅 하기</a>
                  <a href="${pageContext.request.contextPath}/bet/bettingHistory?race_No=${race.race_No }" class="btn btn-secondary py-2 px-3">베팅 현황</a>
                  </p>
               </div>
            </div>
         </div>
         </c:if>

         </c:forEach>
         
         <!-- 경기 종료 -->
          <c:forEach var="race" items="${list }">
         <c:if test = "${race.isEnd == 'Y'}">
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a href="${pageContext.request.contextPath}/race/racingResult?race_No=${race.race_No }&first_Place=${race.first_Place }&second_Place=${race.second_Place }&third_Place=${race.third_Place }" class="block-20"
                  style="background-image: url('${pageContext.request.contextPath}/resources/images/racing/state/list_end.jpg');">
               </a>
               <div class="text d-block">
                  <div class="meta">
                     <p>
                        <a href="${pageContext.request.contextPath}/race/racingResult?race_No=${race.race_No }&first_Place=${race.first_Place }&second_Place=${race.second_Place }&third_Place=${race.third_Place }"><span
                           class="fa fa-calendar mr-2"></span>${race.race_Date }</a>
                     </p>
                  </div>
                  <h3 class="heading">
                     <a href="${pageContext.request.contextPath}/race/racingResult?race_No=${race.race_No }&first_Place=${race.first_Place }&second_Place=${race.second_Place }&third_Place=${race.third_Place }">${race.race_No } 번째 경기</a>
                  </h3>
                  <h4>출전 말</h4>
                  <h5>${race.first_Horse } , ${race.second_Horse }, ${race.third_Horse }, ${race.fourth_Horse }, ${race.fifth_Horse }</h5>      
                  <p>
                     <a href="${pageContext.request.contextPath}/race/racingResult?race_No=${race.race_No }&first_Place=${race.first_Place }&second_Place=${race.second_Place }&third_Place=${race.third_Place }"
                        class="btn btn-secondary py-2 px-3">경기 결과 보기</a>
                  
                  <a href="${pageContext.request.contextPath}/bet/bettingHistory?race_No=${race.race_No }" class="btn btn-secondary py-2 px-3">베팅 내역</a>
                  
                  </p>
               </div>
            </div>
         </div>
         </c:if>
</c:forEach>
      </div>
   </div>
</section>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
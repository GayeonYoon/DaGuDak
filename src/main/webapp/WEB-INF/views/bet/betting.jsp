<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
var maxPoint = ${memberVo.point };

   function betting(e) {
      var keyValue = event.keyCode;
      if (((keyValue >= 48) && (keyValue <= 57)))
         return true;
      else
         return false;
   }

   function insertBetting() {
      var bettingForm = document.bettingFrm;
      if (document.bettingFrm.selected_horse.value == 'none') {
         alert("베팅할 말을 선택 해주세요");
         return;
      } else if (document.bettingFrm.betting_point.value == '') {
         alert("포인트를 입력해주세요");
         return;
      } else if(document.bettingFrm.betting_point.value>maxPoint){
         alert("최대 포인트를 초과 하였습니다.");
        return;
     }else{
        var myBettingPoint = document.bettingFrm.betting_point.value + "";
        var horseName = document.bettingFrm.selected_horse.value + "";
        
        alert(horseName+ "번 말 " + myBettingPoint + "P 베팅 성공");
         bettingForm.submit();
      }
   }
</script>


<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">BETTING</span>
            <h2 class="mb-4">베팅</h2>
            <h3 class="md-4">총 베팅액 : ${totalBettingPoint }</h3>
              <c:if test="${sessionScope.userId != null}">
            <div style="float:right;">
            ${memberVo.name }님   ${memberVo.point } P
            </div>
            </c:if>
            
         </div>
      </div>
   </div>
</section>

<section class="ftco-section bg-light">
   <div class="container">
      <div class="row d-flex">
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a
                  href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${raceInfo.first_Horse }"
                  class="block-20"
                  style="background-image: url('/DaGuDak/resources/images/racing/horses/horse_${raceInfo.first_Horse }.gif');">
               </a>
               <div class="text d-block">

                  <h3 class="heading" align="center">
                     <a
                        href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${raceInfo.first_Horse }">
                        <b>${raceInfo.first_Horse }번 말</b> <br>
                     <b>${raceInfo.first_Horse_Name }</b> <br>
                     <c:set var="horseSpeed" value="${raceInfo.first_Horse_Speed }"/> 구간별 속도: ${fn:substring(horseSpeed,0,1) },${fn:substring(horseSpeed,1,2) },${fn:substring(horseSpeed,2,3) },${fn:substring(horseSpeed,3,4) }
                       <br>승률: ${raceInfo.first_Horse_WinRate } %
                        <br> 현재 베팅액 : ${ firstHorseTotalBettingPoint}
                     </a>
                  </h3>
               </div>
            </div>
         </div>

         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a
                  href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${raceInfo.second_Horse }"
                  class="block-20"
                  style="background-image: url('/DaGuDak/resources/images/racing/horses/horse_${raceInfo.second_Horse }.gif');">
               </a>
               <div class="text d-block">

                  <h3 class="heading" align="center">
                     <a
                        href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${raceInfo.second_Horse }">
                        <b>${raceInfo.second_Horse }번 말</b> <br>
                     <b>${raceInfo.second_Horse_Name }</b> <br>
                     <c:set var="horseSpeed" value="${raceInfo.second_Horse_Speed }"/> 구간별 속도: ${fn:substring(horseSpeed,0,1) },${fn:substring(horseSpeed,1,2) },${fn:substring(horseSpeed,2,3) },${fn:substring(horseSpeed,3,4) }
                         <br>승률: ${raceInfo.second_Horse_WinRate } %
                            <br> 현재 베팅액: ${ secondHorseTotalBettingPoint}
                     </a>
                  </h3>
               </div>
            </div>
         </div>
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a
                  href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${raceInfo.third_Horse }"
                  class="block-20"
                  style="background-image: url('/DaGuDak/resources/images/racing/horses/horse_${raceInfo.third_Horse }.gif');">
               </a>
               <div class="text d-block">

                  <h3 class="heading" align="center">
                     <a
                        href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${raceInfo.third_Horse }">
                        <b>${raceInfo.third_Horse }번 말</b> <br>
                     <b>${raceInfo.third_Horse_Name } </b> <br>
                     <c:set var="horseSpeed" value="${raceInfo.third_Horse_Speed }"/> 구간별 속도: ${fn:substring(horseSpeed,0,1) },${fn:substring(horseSpeed,1,2) },${fn:substring(horseSpeed,2,3) },${fn:substring(horseSpeed,3,4) }
                     <br>승률: ${raceInfo.third_Horse_WinRate } %
         <br> 현재 베팅액: ${ thirdHorseTotalBettingPoint}
                  </a>
                  </h3>
               </div>
            </div>
         </div>
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a
                  href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${raceInfo.fourth_Horse }"
                  class="block-20"
                  style="background-image: url('/DaGuDak/resources/images/racing/horses/horse_${raceInfo.fourth_Horse }.gif');">
               </a>
               <div class="text d-block">

                  <h3 class="heading" align="center">
                     <a
                        href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${raceInfo.fourth_Horse }">
                        <b>${raceInfo.fourth_Horse }번 말</b> <br>
                     <b>${raceInfo.fourth_Horse_Name } </b> <br>
                     <c:set var="horseSpeed" value="${raceInfo.fourth_Horse_Speed }"/> 구간별 속도: ${fn:substring(horseSpeed,0,1) },${fn:substring(horseSpeed,1,2) },${fn:substring(horseSpeed,2,3) },${fn:substring(horseSpeed,3,4) }
                    <br>승률 :
                        ${raceInfo.fourth_Horse_WinRate } %
                     <br> 현재 베팅액 : ${ fourthHorseTotalBettingPoint}
                     </a>
                  </h3>
               </div>
            </div>
         </div>
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a
                  href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${raceInfo.fifth_Horse }"
                  class="block-20"
                  style="background-image: url('/DaGuDak/resources/images/racing/horses/horse_${raceInfo.fifth_Horse }.gif');">
               </a>
               <div class="text d-block">

                  <h3 class="heading" align="center">
                     <a
                        href="${pageContext.request.contextPath}/horse/horseInfo?horse_no=${raceInfo.fifth_Horse }">
                        <b>${raceInfo.fifth_Horse }번 말</b> <br>
                     <b>${raceInfo.fifth_Horse_Name } </b> <br>
                     <c:set var="horseSpeed" value="${raceInfo.fifth_Horse_Speed }"/> 구간별 속도: ${fn:substring(horseSpeed,0,1) },${fn:substring(horseSpeed,1,2) },${fn:substring(horseSpeed,2,3) },${fn:substring(horseSpeed,3,4) }
                    <br>승률 :
                        ${raceInfo.fifth_Horse_WinRate } %
                         <br> 현재 베팅액 : ${ fifthHorseTotalBettingPoint}
                     </a>
                  </h3>
               </div>
            </div>
         </div>
      </div>
      <c:choose>
         <c:when test="${sessionScope.userId == null}">
            <p align="center">로그인 후 이용해 주세요</p>
         </c:when>
         <c:otherwise>
            <p align="center">
               <a href="#" class="btn btn-secondary py-2 px-3" data-toggle="modal"
                  data-target="#bettingModalCenter">베팅하기</a>
            </p>
         </c:otherwise>
      </c:choose>
   </div>
</section>

<div class="modal fade" id="bettingModalCenter" tabindex="-1"
   role="dialog" aria-labelledby="bettingModalCenterTitle"
   aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered" role="document">
      <!-- 베팅 모달창 -->
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
            <!-- 베팅 form -->
            <form action="${pageContext.request.contextPath}/bet/betting"
               method="post" class="appointment-form ftco-animate"
               name="bettingFrm">
               <h3>
                  <span style="align-content: center;">베팅하기</span>
               </h3>
               <div class="form-group">
               <input type="hidden" name="race_no" id="race_no" value="${raceInfo.race_No }">
                  <input type="hidden" name="member_id" value="${sessionScope.userId }">
                   <div class="select-wrap">
                   <div class="icon"><span class="fa fa-chevron-down"></span></div>
                   <select name="selected_horse" id="selected_horse" class="form-control mb-3" style="text-align-last: center;">
                     <option value="none" style="text-align-last: center;" >베팅할 말 선택하기</option>
                     <option value="${raceInfo.first_Horse }">${raceInfo.first_Horse }번
                        ${raceInfo.first_Horse_Name }</option>
                     <option value="${raceInfo.second_Horse }">${raceInfo.second_Horse }번
                        ${raceInfo.second_Horse_Name }</option>
                     <option value="${raceInfo.third_Horse }">${raceInfo.third_Horse }번
                        ${raceInfo.third_Horse_Name }</option>
                     <option value="${raceInfo.fourth_Horse }">${raceInfo.fourth_Horse }번
                        ${raceInfo.fourth_Horse_Name }</option>
                     <option value="${raceInfo.fifth_Horse }">${raceInfo.fifth_Horse }번
                        ${raceInfo.fifth_Horse_Name }</option>
                  </select></div>
                  <input type="number" onKeyPress="return betting(event)"
                     name="betting_point" id="betting_point" class="form-control"
                     min='100' max='${memberVo.point }' step='100' style="text-align-last: center;"
                     placeholder="베팅할 포인트">
               </div>
               <div class="form-group">
                  <input type="button" onclick="insertBetting();" value="베팅"
                     class="btn btn-primary py-3 px-4">
               </div>
            </form>

            <div style="margin: auto; text-align-last: center;" class="ftco-animate">
               <span>${memberVo.name }님의 포인트 : ${memberVo.point } P</span>
            </div>
         </div>
      </div>
   </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
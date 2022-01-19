<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
function updateHorse(horse_no) {
   location.href="/DaGuDak/horse/updateForm?horse_no="+horse_no;   
};

function deleteHorse(horse_no) {
   var result = confirm("말을 삭제하시겠습니까?");
   if(result) {
      location.href="/DaGuDak/horse/delete?horse_no="+horse_no;
      alret("삭제되었습니다.")
   }
};

function horseList() {
   location.href="/DaGuDak/horse/horses";   
}
</script>
<c:if test="${deleteResult == 'false'}">
<script>
alert("삭제에 실패했습니다.");
</script>
</c:if>

<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">HORSE INFORMATION</span>
            <h2 class="mb-5">경주마 정보</h2>
         </div>
      </div>
   </div>
</section>

   <section class="pt-3 pb-5" id="about-section">
      <div class="container" align="center">

         <div class="row">
            <div class="col-md-6 d-flex align-items-stretch">
               <div class="about-wrap img w-100"
                  style="background-image: url(/DaGuDak/resources/images/racing/horses/horse_${horse.horse_no}.gif); ">
               </div>
            </div>
            <div class="col-md-4 py-5 pl-md-5">
               <div class="row justify-content-center mb-4 pt-md-4">
                  <div class="col-md-12 heading-section ftco-animate">
                     <span class="subheading"> 상세정보</span>
                     <h2 class="mb-5">${horse.horse_name}</h2>
                     <table style="color: black; font-size: 20px;">
                        <tr><th style="padding-right: 50px;">고유번호</th><th>${horse.horse_no}번</th></tr>
                        <tr>
                           <td><b>품종</b></td>
                           <td>${horse.kind}</td>
                        </tr>
                        <tr>
                           <td><b>연령</b></td>
                           <td>${horse.age}</td>
                        </tr>
                        <tr>
                           <td><b>성별</b></td>
                           <td>${horse.gender}</td>
                        </tr>
                        <tr>
                        <td><b>구간별 속도</b></td>
                        <td> <c:set var="horseSpeed" value="${horse.speed }"/>${fn:substring(horseSpeed,0,1) },${fn:substring(horseSpeed,1,2) },${fn:substring(horseSpeed,2,3) },${fn:substring(horseSpeed,3,4) }</td>
                        </tr>
                        <tr>
                           <td><b>우승 횟수</b></td>
                           <td>${horse.win_count}회</td>
                        </tr>
                        <tr>
                           <td><b>출전 횟수</b></td>
                           <td>${horse.total_games}회</td>
                        </tr>
                        <tr>
                           <td><b>승률</b></td>
                           <td>${horse.win_rate} %</td>
                        </tr>
                     </table>

                  </div>
               </div>
            </div>
         </div>
      </div>

<c:if test="${sessionScope.userId =='admin' }">
   <div align="center" class="mt-5 mb-5">
      <button type="button" onclick="javascript:updateHorse(${horse.horse_no})"
         class="btn btn-primary py-3 px-5">수정</button>
      <button type="button" onclick="javascript:deleteHorse(${horse.horse_no})"
         class="btn btn-primary py-3 px-5">삭제</button>
      <button type="button"
         onclick="javascript:horseList()"
         class="btn btn-primary py-3 px-5">목록</button>
   </div>
</c:if>
</section>

</body>
</html>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
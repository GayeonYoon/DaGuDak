<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp"%>

<script>
function goToRacing(race_no) {
   location.href="/DaGuDak/race/racing?race_no="+race_no;   
};
</script>
<style>
#endGame {
   font-size: xxx-large;
    font-weight: bold;
    color: #fc5e28;
    padding: 0 0 100px 0;
}

</style>

<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">RACING</span>
            <h2 class="mb-4">다 그 닥 경 마</h2>
         </div>
      </div>
   </div>
</section>

<section class="ftco-section bg-light">
   <div class="container">
      <div class="ftco-animate" id="endGame" align="center">
         모든 경기가<br>종료되었습니다.
      </div>
      <div align="center">
         <a href="/DaGuDak/race/racingList" class="btn btn-primary py-3 ftco-animate">지난 경기 결과 보기</a>
      </div>
   </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
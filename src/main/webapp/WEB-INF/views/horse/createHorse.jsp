<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>
<c:if test="${sessionScope.userId != 'admin'}">
<script>
alert("관리자 페이지에 접근할 수 없습니다.");
history.back();
</script>
</c:if>


<section class="ftco-section contact-section ftco-no-pb"
	id="contact-section">
	<div class="container">
		<div class="row justify-content-center pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">HORSE INFORMATION</span>
				<h2 class="mb-4">경주마 정보</h2>
				<p>말 생성</p>
			</div>
		</div>
	</div>
</section>

<section class="contact-section" id="contact-section">
	<div class="container">
		<div class="row block-9"
			style="margin: auto; margin-bottom: 50px; width: 80%;">
			<!-- form -->
			<form name="horseCreate" method="post"
				action="${pageContext.request.contextPath}/horse/create"
				class="p-4 p-md-5 contact-form">
				
               <div class="row">
             	<div class="col-md-12">마명</div>
               <div class="col-md-12">
                  <div class="form-group">
                     <input type="text" name="horse_name" class="form-control"
                        maxlength="10" placeholder="마명을 입력하세요" required>
                  </div>
               </div>
               <div class="col-md-6">품종</div> <div class="col-md-6">성별</div>
               <div class="col-md-6">
                  <div class="form-group">
                     <input type="text" name="kind" class="form-control"
                        maxlength="10" placeholder="품종을 입력하세요" required>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="form-group">
                     <input type="text" name="gender" class="form-control"
                        maxlength="3" placeholder="성별 입력하세요" required>
                  </div>
               </div>
               
               <div class="col-md-6">연령</div><div class="col-md-6">무게</div>
               <div class="col-md-6">
                  <div class="form-group">
                     <input type="text" name="age" class="form-control"
                        maxlength="16" placeholder="연령을 입력하세요" required>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="form-group">
                     <input type="text" name="weight" class="form-control"
                        maxlength="16" placeholder="무게를 입력하세요" required>
                  </div>
               </div>
               
				<div class="col-md-12">속력</div>
               <div class="col-md-3">
                  <div class="form-group">
                     <input type="text" name="speed1" class="form-control"
                        maxlength="1" placeholder="속력1" required>
                  </div>
               </div>
               
               <div class="col-md-3">
                  <div class="form-group">
                     <input type="text" name="speed2" class="form-control"
                        maxlength="1" placeholder="속력2" required>
                  </div>
               </div>
               
               <div class="col-md-3">
                  <div class="form-group">
                     <input type="text" name="speed3" class="form-control"
                        maxlength="1" placeholder="속력3" required>
                  </div>
               </div>
               <div class="col-md-3">
                  <div class="form-group">
                     <input type="text" name="speed4" class="form-control"
                        maxlength="1" placeholder="속력4" required>
                  </div>
               </div>
				
				</div>
				<div align="center">
					<div class="form-group mt-5">
						<input type="submit" value="생성" class="btn btn-primary py-3 px-5" />
						<button type="reset" class="btn btn-primary py-3"
							style="padding-left: 32px; padding-right: 32px;">다시 작성</button>
						<button type="button"
							onclick="location.href='/DaGuDak/horse/horses'"
							class="btn btn-primary py-3 px-5">목록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

 <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
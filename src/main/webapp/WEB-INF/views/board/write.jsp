<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>
<c:if test="${ (sessionScope.bid == '1' || sessionScope.bid == '4') && sessionScope.userId != 'admin'}">
<script>
alert("관리자 페이지에 접근할 수 없습니다.");
history.back();
</script>
</c:if>

<c:if test="${sessionScope.bid == '2' || sessionScope.bid > 4}">
<script>
alert("접근할 수 없습니다.");
history.back();
</script>
</c:if>

<% //bid == 1 : 공지사항, // 2 : 관련 뉴스 , // 3 : 익명게시판, // 4 : 고객센터 FAQ  // 5 : 고객센터 1:1문의 %>
<section class="ftco-section contact-section ftco-no-pb"
	id="contact-section">
	<div class="container">
		<div class="row justify-content-center pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<c:if test="${sessionScope.bid == '1'}">
					<span class="subheading">NOTICE</span>
					<h2 class="mb-4">공 지 사 항</h2>
					<p>글쓰기</p>
				</c:if>
				<c:if test="${sessionScope.bid == '3'}">
					<span class="subheading">ANONYMOUS BOARD</span>
					<h2 class="mb-4">익 명 게 시 판</h2>
					<p>글쓰기</p>
				</c:if>
				<c:if test="${sessionScope.bid == '4'}">
					<span class="subheading">CUSTOMER SERVICE</span>
					<h2 class="mb-4">고 객 센 터</h2>
					<p>글쓰기</p>
				</c:if>
			</div>
		</div>
	</div>
</section>

<section class="contact-section" id="contact-section">
	<div class="container">
		<div class="row block-9"
			style="margin: auto; margin-bottom: 50px; width: 80%;">
			<!-- form -->
			<form name="boardWriteForm" method="post" enctype="multipart/form-data"
				action="${pageContext.request.contextPath}/board/insert"
				class="p-4 p-md-5 contact-form">
				
				<input type="hidden" name="bid" value="${sessionScope.bid }">

				<c:if test="${ (sessionScope.bid == '1' || sessionScope.bid == '4') && sessionScope.userId == 'admin'}">
				<input type="hidden" name="writer" value="${sessionScope.userName }">
				<input type="hidden" name="password" value="${sessionScope.userId }">
				</c:if>
				
               <div class="row">
               
               <c:if test="${sessionScope.bid == '3'}">
               <div class="col-md-6">
                  <div class="form-group">
                     <input type="text" name="writer" class="form-control"
                        maxlength="16" placeholder="닉네임을 입력하세요" required>
                  </div>
               </div>

               <div class="col-md-6">
                  <div class="form-group">
                     <input type="password" name="password" class="form-control"
                        maxlength="16" placeholder="비밀번호를 입력하세요" required>
                  </div>
               </div>
               </c:if>

               <div class="col-md-12">
                  <div class="form-group">
                     <input type="text" name="title" class="form-control"
                        maxlength="66" placeholder="제목을 입력하세요" required>
                  </div>
               </div>

               <div class="col-md-12">
                  <div class="form-group">
                     <textarea name="content" id="" cols="30" rows="20"
                        class="form-control" placeholder="내용을 입력하세요" required></textarea>
                  </div>
               </div>

               <div class="col-md-12">
                  <div class="form-group">
                     <input type="file" name="file" class="form-control">
                  </div>
               </div>
            </div>

				<div align="center">
					<div class="form-group">
						<input type="submit" value="확인" class="btn btn-primary py-3 px-5" />
						<button type="reset" class="btn btn-primary py-3"
							style="padding-left: 32px; padding-right: 32px;">다시 작성</button>
						<button type="button"
							onclick="javascript:listBtn('${sessionScope.bid }', '${map.boardPager.curPage }', '${map.searchOption }', '${map.keyword }')"
							class="btn btn-primary py-3 px-5">목록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
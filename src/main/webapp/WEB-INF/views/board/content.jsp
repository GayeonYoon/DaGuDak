<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>
<c:if
	test="${sessionScope.bid == '' || sessionScope.bid == null || sessionScope.bid == '0'} ">
	<script>
location.href="home"
</script>
</c:if>

<c:if test="${deletePasswordCheck=='false' || cmtUpdatePasswordCheck == 'false' || cmtDeletePasswordCheck == 'false'}">
<script>
alert("비밀번호가 일치하지 않습니다.");
</script>
</c:if>

<script src="<c:url value="/resources/js/board/comment.js" />"></script>

<section class="ftco-section contact-section ftco-no-pb"
	id="contact-section">
	<div class="container">
		<div class="row justify-content-center pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<c:if test="${sessionScope.bid == '1'}">
					<span class="subheading">NOTICE</span>
					<h2 class="mb-4">공 지 사 항</h2>
				</c:if>
				<c:if test="${sessionScope.bid == '2'}">
					<span class="subheading">NEWS</span>
					<h2 class="mb-4">경 마 뉴 스</h2>
				</c:if>
				<c:if test="${sessionScope.bid == '3'}">
					<span class="subheading">ANONYMOUS BOARD</span>
					<h2 class="mb-4">익 명 게 시 판</h2>
				</c:if>
				<c:if test="${sessionScope.bid == '4'}">
					<span class="subheading">CUSTOMER SERVICE</span>
					<h2 class="mb-4">고 객 센 터</h2>
				</c:if>
			</div>
		</div>
	</div>
</section>

<section>
	<div style="margin-left: 20%; margin-right: 20%;">
	<c:choose>
			<c:when
				test="${(sessionScope.bid == '1' || sessionScope.bid == '4') && sessionScope.userId == 'admin'}">
				<div style="margin-left: 0px; margin-bottom: 10px; float: right;">
					<button type="button" id="btnWrite" name="btnWrite"
						class="btn btn-primary">작성하기</button>
				</div>
			</c:when>

			<c:when test="${sessionScope.bid == '3'}">
				<div style="margin-left: 0px; margin-bottom: 10px; float: right;">
					<button type="button" id="btnWrite" name="btnWrite"
						class="btn btn-primary">작성하기</button>
				</div>
			</c:when>
	</c:choose>
	</div>
	
	<!-- 회색 박스 -->
	<div class="comment-form-wrap pt-5 py-5 pr-5 pl-5 mb-5"
		style="margin-left: 20%; margin-right: 20%; background-color: #f8f9fa;">

		<!-- 제목 -->
		<div>
			<h3 class="font-weight-bold py-2" align="center"
				style="background: linen; border-radius: 5px;">${dto.title }</h3>
			<div class="mt-5 mb-5 pt-3 pb-3">
			<c:if test="${sessionScope.bid != 2 }">
				<div style="width: 50%; float: left;">조회수 : ${dto.viewcnt }</div></c:if>
				<div style="width: 50%; float: right; text-align: right;">
					<fmt:formatDate value="${dto.regdate }" type="both" />
				</div>
				<c:if test="${sessionScope.bid != 2 }">	<div class="mt-5">
						<h5>작성자: ${dto.writer}</h5>
					</div></c:if>
			</div>
		</div>

		<!-- 글 내용 -->
		<div class="pt-5 pb-5">
			<div style="margin: auto; ">
				<p style="color: black; font-size: 90%">${dto.content }</p>
				<c:if test="${dto.file_name != null }">
					<img src="<%=request.getContextPath() %>/resources/upload/${dto.file_rename}">
				</c:if>
			</div>
		</div>

		<!-- 댓글 -->
		<c:if test="${sessionScope.bid == '3'}">
				<!-- 댓글 내용 -->
				<div id="commentList"></div>
				<script> commentList(${sessionScope.bid}, ${dto.bno})</script>
				
				<!-- 댓글 입력창 -->
				<div class="mx-5 mt-4" align="center">
					<ul class="comment-list">
						<!-- form -->
						<li class="comment mt-5">
							<div class="" align="center">
								<form name="comment" method="post"
								action="${pageContext.request.contextPath}/comment/insert" class="contact-form">
									<input type="text" name="cmt_writer" class="form-control mr-1" placeholder="닉네임"
										style="font-size: 15px; width: 30%; float: left;" 
										maxlength="16" required>
										
									<input type="password" name="cmt_password" class="form-control" placeholder="비밀번호"
										style="font-size: 15px; width: 30%; float: left;"
										maxlength="16" required>
									<textarea name="cmt_content" class="form-control mt-1" placeholder="댓글 내용"
										style="font-size: 15px; float: left;" required></textarea>
										<div class="comment-body">
									<button onclick="document.getElement('comment').submit()" class="reply mt-1" style="border-color: transparent;float: right;">댓글 달기</button>
									</div>
									<input type="hidden" name="bid" value="${dto.bid }">
									<input type="hidden" name="bno" value="${dto.bno }">
								</form>
							</div>
						</li>
					</ul>
				</div>
		</c:if>

		<!-- 하단 버튼 -->
		<c:choose>
			<c:when test="${ (sessionScope.bid == '1' || sessionScope.bid == '4') && sessionScope.userId == 'admin'}">
				<div align="center">
					<button type="button"
						onclick="javascript:updateFormBtn(${dto.bno })"
						class="btn btn-primary py-3 px-5">수정</button>
					<a href="#" class="btn btn-primary py-3 px-5 mb-5 mt-5"
						data-toggle="modal" data-target="#anonymousContentDelete">삭제</a>
					<button type="button"
						onclick="javascript:listBtn('${sessionScope.bid }', '${map.boardPager.curPage }', '${map.searchOption }', '${map.keyword }')"
						class="btn btn-primary py-3 px-5">목록</button>
				</div>
			</c:when>
			<c:when test="${sessionScope.bid == '3'}">
				<div align="center">
					<button type="button"
						onclick="javascript:updateFormBtn(${dto.bno })"
						class="btn btn-primary py-3 px-5">수정</button>
					<a href="#" class="btn btn-primary py-3 px-5 mb-5 mt-5"
						data-toggle="modal" data-target="#anonymousContentDelete">삭제</a>
					<button type="button"
						onclick="javascript:listBtn('${sessionScope.bid }', '${map.boardPager.curPage }', '${map.searchOption }', '${map.keyword }')"
						class="btn btn-primary py-3 px-5">목록</button>
				</div>
			</c:when>
		</c:choose>
	</div>
</section>


<!-- 삭제 모달창 -->
<div class="modal fade" id="anonymousContentDelete" tabindex="-1"
	role="dialog" aria-labelledby="anonymousContentDeleteTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<!-- 모달창 -->
		<div class="modal-content">
			<!-- 닫기 버튼 -->
			<div class="modal-header">
				<button type="button"
					class="close d-flex align-items-center justify-content-center"
					data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true" class="fa fa-close"></span>
				</button>
			</div>

			<div class="modal-body p-4 p-md-5">
				<!-- form -->
				<form name="deleteForm" action="delete" method="post"
					class="appointment-form ftco-animate">
					<h3>
						<span style="align-content: center;">게시글 삭제</span>
					</h3>

					<div class="">
						<div class="form-group">
							<c:if
								test="${ (sessionScope.bid == '1' || sessionScope.bid == '4') && sessionScope.userId == 'admin'}">
								<h6>게시글을 삭제하시겠습니까?</h6>
								<input type="hidden" name="password"
									value="${sessionScope.userId }">
							</c:if>

							<c:if test="${bid == '3'}">
								<input type="password" name="password" class="form-control"
									placeholder="비밀번호를 입력하세요" required>
							</c:if>

						</div>
						<div class="form-group">
							<input type="submit" value="글 삭제"
								class="btn btn-primary py-3 px-4">
						</div>
					</div>
					<input type="hidden" name="bid" value="${sessionScope.bid }">
					<input type="hidden" name="bno" value="${dto.bno }">
				</form>
				<c:if test="${bid == '3'}">
					<div align="center" class="ftco-animate" style="font-size: small;">
						<p>게시글 작성 시 입력한 비밀번호와 일치해야 합니다.</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
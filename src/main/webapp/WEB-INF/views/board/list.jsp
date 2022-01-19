<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board.css">
<%
	//bid 1 공지사항 , 2 경마뉴스, 3 익명게시판, 4 고객센터
%>

<c:if test="${sessionScope.bid == '' || sessionScope.bid == null || sessionScope.bid == '0'} ">
	<script>
location.href="home"
</script>
</c:if>

<c:if test="${deletePasswordCheck == 'true'}">
<script>
alert("게시글이 삭제되었습니다.");
</script>
</c:if>

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

<div class="limiter" style="margin-bottom: 50px;">
	<div class="container-table100">
		<div class="wrap-table100">
			<div align="right" style="margin-bottom: 5px;">
			 	<c:if test="${sessionScope.bid == '4'}">
					<div style="margin-right: 0px; margin-bottom: 5px; width: 135px; float: left;">
						<div class="btn btn-dark"> FAQ </div>
						<a href="#"	class="btn btn-dark"> 1:1 문의 </a>
					</div>
				</c:if> 
				<c:choose>
					<c:when test="${sessionScope.bid == '1' && sessionScope.userId == 'admin'}">
					<div style="margin-left: 0px; margin-bottom: 5px; float: right;">
						<button type="button" id="btnWrite" name="btnWrite"
							class="btn btn-primary">작성하기</button></div></c:when>
					<c:when test="${sessionScope.bid == '3'}">
						<div style="margin-left: 0px; margin-bottom: 5px; float: right;">
							<button type="button" id="btnWrite" name="btnWrite"
								class="btn btn-primary">작성하기</button></div></c:when>
					<c:when test="${sessionScope.bid == '4' && sessionScope.userId == 'admin'}">
						<div style="margin-left: 0px; margin-bottom: 5px; float: right;">
							<button type="button" id="btnWrite" name="btnWrite"
								class="btn btn-primary">FAQ 작성하기</button></div></c:when>
				</c:choose>
			</div>

			<div class="table">
				<div class="hrows header">
					<div class="cell">번호</div>
					<div class="cell">제목</div>
					<div class="cell">이름</div>
					<div class="cell">작성일</div>
					<c:if test="${sessionScope.bid != 2 }">
					<div class="cell">조회수</div>
					</c:if>
				</div>
				<c:forEach var="row" items="${map.list }">
						<div class="rows" onclick="javascript:contentBtn('${row.bno}', '${map.boardPager.curPage }', '${map.searchOption }', '${map.keyword }')">
						<div class="cell" data-title="번호">${row.bno}</div>
						<div class="cell" data-title="제목"><font color="black"><b>${row.title }</b></font>
						<c:if test="${sessionScope.bid == '3' && row.cmtcount > 0 }">
							&nbsp;&nbsp;(댓글: ${row.cmtcount })</c:if>
						</div>
						<div class="cell" data-title="이름">${row.writer }</div>
						<div class="cell" data-title="작성일">
							<fmt:formatDate value="${row.regdate }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
						<c:if test="${sessionScope.bid != 2 }">
						<div class="cell" data-title="조회수" align="center">${row.viewcnt}
						</div>
						</c:if>
					</div>
				</c:forEach>
			</div>

			<c:if test="${sessionScope.bid != '2'}">
				<!-- 신 검색창  -->
				<div style="background-color: #f2f2f2; padding: 10px; height: 75px;">
					<div class="sidebar-box" style="padding: 0px;">
						<form name="search" id="search" method="post"
							action="${pageContext.request.contextPath}/board/list"
							class="search-form" style="padding: 0px;">
							<div class="select-wrap appointment-form"
								style="width: 29%; margin: 0px; float: left;">
								<select name="searchOption"
									class="form-control appointment-form" style="font-size: 13px;">
									<option value="all"
										<c:out value="${map.searchOption== 'all'?'selected':''}"/>>
										제목+이름+내용</option>
									<option value="writer"
										<c:out value="${map.searchOption== 'writer'?'selected':''}"/>>
										이름</option>
									<option value="content"
										<c:out value="${map.searchOption== 'content'?'selected':''}"/>>
										내용</option>
									<option value="title"
										<c:out value="${map.searchOption== 'title'?'selected':''}"/>>
										제목</option>
								</select>
							</div>

							<div class="form-group"
								style="width: 69%; margin: 0px; float: right;">
								<input name="keyword" value="${map.keyword }"
									class="form-control" placeholder="검색어를 입력하세요">
								<button onclick="document.getElement('search').submit()"
									class="icon fa fa-search"
									style="border-color: transparent; background-color: transparent;"></button>

							</div>
						</form>
					</div>
				</div>


				<!-- 페이지 번호 -->
				<div class="row" style="margin-top: 4rem">
					<div class="col text-center">
						<div class="block-27">
							<ul>
								<%-- <c:if test = "${map.boardPager.curBlock>1 }">
                  <a href = "javascript:list('1')">[처음]</a>
                  </c:if> --%>
								<c:if test="${map.boardPager.curBlock > 1 }">
									<li><a 
										href="javascript:listBtn('${sessionScope.bid }','${map.boardPager.prevPage }','${map.searchOption}','${map.keyword }')">&lt;</a></li>
								</c:if>
								<c:forEach var="num" begin="${map.boardPager.blockBegin }"
									end="${map.boardPager.blockEnd }">
									<c:choose>
										<c:when test="${num==map.boardPager.curPage }">
											<li class="active"><span>${num }</span></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="javascript:listBtn('${sessionScope.bid }','${num }','${map.searchOption}','${map.keyword }')">${num }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if
									test="${map.boardPager.curBlock<=map.boardPager.totBlock }">
									<li><a 
										href="javascript:listBtn('${sessionScope.bid }','${map.boardPager.nextPage }','${map.searchOption}','${map.keyword }')">&gt;</a></li>
								</c:if>

								<%--     <c:if test="${map.boardPager.curPage<=map.boardPager.totPage }">   
                  <a href="javascript:list('${map.boardPager.totPage }')">[끝]</a>
                  </c:if> --%>
								
							</ul>
						</div>
					</div>
				</div>
				<!-- 페이지 번호 -->
			</c:if>
		</div>
	</div>
</div>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
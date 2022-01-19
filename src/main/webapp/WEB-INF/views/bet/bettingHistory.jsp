<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file = "/WEB-INF/views/common/head.jsp" %>
   <link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/bettingHistory.css">

<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">BETTING HISTORY</span>
            <h2 class="mb-4">베팅 히스토리</h2>
            <p style="font-size:18px;" align = "right">★ ${race_no }번째 경기 ★</p>
         </div>
      </div>
   </div>
</section>


<div class="limiter" style="margin-bottom: 50px;">
   <div class="container-table100">
      <div class="wrap-table100">

         <div class="table">
            <div class="hrows header">
               <div class="cell">No</div>
               <div class="cell">Horse No</div>
               <div class="cell">Horse Name</div>
               <div class="cell">Id</div>
               <div class="cell">Betting Point</div>
            </div>
            <c:forEach var="betting" items="${map.list }" varStatus="status">
<div class="rows">
                  <div class="cell" data-title="No">${status.count}</div>
                  <div class="cell" data-title="Horse">${betting.selected_horse }번 말</div>
                  <div class="cell" data-title="HorseName">${betting.horse_name }</div>
                  <div class="cell" data-title="Id">${betting.member_id } 님</div>
                  <div class="cell" data-title="BettingPoint">${betting.betting_point } P</div>
               </div>
            </c:forEach>
         </div>

         <!-- 신 검색창  -->
         <div style="background-color: #f2f2f2; padding: 10px; height: 75px;">
            <div class="sidebar-box" style="padding: 0px;">
               <form name="search" id="search" method="get"
                  action="${pageContext.request.contextPath}/bet/bettingHistory"
                  class="search-form" style="padding: 0px;">
                  <div class="select-wrap appointment-form"
                     style="width: 29%; margin: 0px; float: left;">
                     <select name="searchOption" class="form-control appointment-form"
                        style="font-size: 13px;">
                        <option value="all"
                        <c:out value="${map.searchOption== 'all'?'selected':''}"/>>Horse No + Horse Name + Id</option>
                        <option value="selected_horse"
                        <c:out value="${map.searchOption== 'selected_horse'?'selected':''}"/>>Horse No</option>
                        <option value="(select horse_name from
            horse h where b.selected_horse = h.horse_no)"
                        <c:out value="${map.searchOption== '(select horse_name from
            horse h where b.selected_horse = h.horse_no)'?'selected':''}"/>>Horse Name</option>
                        <option value="member_id"
                        <c:out value="${map.searchOption== 'member_id'?'selected':''}"/>>Id</option>
                     </select>
                  </div>
                  <div class="form-group"
                     style="width: 69%; margin: 0px; float: right;">
                     <input name="keyword" value="${map.keyword }"
                        class="form-control" placeholder="검색어를 입력하세요">
                        <input type="hidden" name = "race_No" value = "${race_no }">
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
                              href="javascript:bettingHistoryBtn('${race_no}','${map.boardPager.prevPage }','${map.searchOption}','${map.keyword }')">&lt;</a></li>
                        </c:if>
                        <c:forEach var="num" begin="${map.boardPager.blockBegin }"
                           end="${map.boardPager.blockEnd }">
                           <c:choose>
                              <c:when test="${num==map.boardPager.curPage }">
                                 <li class="active"><span>${num }</span></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a
                                    href="javascript:bettingHistoryBtn('${race_no }','${num }','${map.searchOption}','${map.keyword }')">${num }</a></li>
                              </c:otherwise>
                           </c:choose>
                        </c:forEach>
                        <c:if
                           test="${map.boardPager.curBlock<=map.boardPager.totBlock }">
                           <li><a 
                              href="javascript:bettingHistoryBtn('${race_no }','${map.boardPager.nextPage }','${map.searchOption}','${map.keyword }')">&gt;</a></li>
                        </c:if>

                        <%--     <c:if test="${map.boardPager.curPage<=map.boardPager.totPage }">   
                  <a href="javascript:list('${map.boardPager.totPage }')">[끝]</a>
                  </c:if> --%>
                        
                     </ul>
                  </div>
               </div>
            </div>
            <!-- 페이지 번호 -->
      </div>
   </div>
</div>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
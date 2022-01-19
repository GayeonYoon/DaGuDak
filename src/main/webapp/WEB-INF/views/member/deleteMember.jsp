<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file = "/WEB-INF/views/common/head.jsp" %>
   
  <c:if test = "${deleteMessage eq '실패'}">
   <script>
   alert("비밀번호가 틀립니다.");
   </script>
  </c:if>
   
   
<section class="ftco-section bg-light">

      <div class="container">
      
         <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
               <span class="subheading">withdrawal</span>
               <h2 class="mb-4">회원 탈퇴</h2>
                
            </div>
         </div>
          
         <div class="row block-9" style="margin:auto; margin-bottom: 50px; width: 60%;">
            <div>
               <form action="${pageContext.request.contextPath}/member/deleteMember" method="post" class="p-4 p-md-5 contact-form" >
                  <div class="row" >
                  
                     <div class="col-md-12">
                        <div class="form-group">
                           <input type="text" id ="member_id" name="member_id" readonly="readonly" class="form-control"  value="${vo.member_id}"  required>
                        </div>
                     </div>
                     
                     <div class="col-md-12">
                        <div class="form-group">
                           <input type="password" id = "password" name="password" class="form-control" placeholder="비밀번호" required>
                        </div> 
                     </div>
                     
                     <div style="margin-left: auto;  margin-right: auto; margin-top: 20px;">
                        <div class="form-group">
                           <input type="submit" value="탈퇴하기" class="btn btn-dark py-3 px-5">
                        </div>
                     </div>
                  </div>
               </form>     
            </div>
         </div> 
    </div>
 </section>
 
 
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
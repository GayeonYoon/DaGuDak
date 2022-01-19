<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    <%@ include file = "/WEB-INF/views/common/head.jsp" %>
<section class="ftco-section bg-light">

      <div class="container">
      
         <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
               <span class="subheading">My Page</span>
               <h2 class="mb-4">마이 페이지 수정하기</h2>
                
            </div>
         </div> 

         <div class="row block-9" style="margin:auto; margin-bottom: 50px; width: 60%;">
            <div>
               <form method ="post" action="${pageContext.request.contextPath}/member/confirmUpdate"  class="p-4 p-md-5 contact-form" >
                  <div class="row" >
                  
                   <div class="col-md-11">
                  <div class="form-group">
                  <label for="id">아이디</label> 
                     <input type="text" name="member_id" id="member_id" class="form-control" readonly="readonly" value="${vo.member_id}" style="float: left;">
                  </div>
               </div>
               
               <div class="col-md-11">
                  <div class="form-group">
                  <label for="name">이름</label> 
                     <input type="text" name="name" class="form-control" value="${vo.name}" readonly="readonly"  required>
                     
                  </div>
               </div>
                

               <div class="col-md-11">

                  <div class="form-group">
                  <label for=password>비밀번호</label> 
                     <input type="password" name="password" id="password"
                        class="form-control" placeholder="비밀번호"  onkeyup="chkPW()" required>
                       <div id="chkPW"></div>
                  </div>
               </div>
               
               <div class="col-md-11">
                  <div class="form-group">
                  <label for=checkPassword>비밀번호 확인</label> 
                     <input type="password" name="checkPassword" id="checkPassword"
                        class="form-control" onkeyup="duplicatePW()" placeholder="비밀번호 확인" required>
                     <div id="passwordChecked"></div>
                  </div>
               </div>
               
                 
               <div class="col-md-11">
                  <div class="form-group">
                     <label for=checkBirth>이메일 ('@'를 포함해 주세요.)</label> 
                        <input type="email" name="email" class="form-control" value="${vo.email}" required>
                  </div>
                 </div>
                   
                <div class="col-md-11">
                  <div class="form-group">
                     <label for=checkBirth>전화번호 ('-'없이 입력하세요.)</label> 
                        <input type="tel" name="phone" class="form-control" value="${vo.phone}" required>
                  </div>
                </div>
                    
                   
                    <div style="margin-left: auto;  margin-right: auto; margin-top: 20px; margin-bottom : 20px;">
                        <div class="form-group">
                           <input type="submit" id="submit" value="완료" class="btn btn-primary py-3 px-5">
                            
                        </div>
                     </div>
                  </div>
               </form>   
            </div>
            
         </div>
      </div>
   </section>
   <script src="<c:url value="/resources/js/member/register.js" />"></script>
          <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
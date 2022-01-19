<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp"%>

<c:if test="${pwdCheck  eq '실패' }">
	<script>
		alert("비밀번호가 맞지 않습니다.");
	</script>
</c:if>


<section class="ftco-section contact-section ftco-no-pb"
	id="contact-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">POINT BANK</span>
				<h2 class="mb-4">본인 확인</h2>
				<p>본인 확인을 위해 비밀번호를 입력해 주세요.</p>
			</div>
		</div>

		<div class="row block-9"
			style="margin: auto; margin-bottom: 50px; padding: 0 calc(50% - 200px);">
			<div>
				<form name="charge"
					action="${pageContext.request.contextPath}/member/checkPwd"
					method="post" id="checkPwd" name="checkPwd"
					class="p-4 p-md-5 contact-form">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<input type="password" id="password" name="password"
									class="form-control" placeholder="비밀번호" required>
							</div>
						</div>

						<div
							style="margin-left: auto; margin-right: auto; margin-top: 20px;">
							<div class="form-group">
								<input type="submit" value="비밀번호 확인"
									class="btn btn-primary py-3 px-5">
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
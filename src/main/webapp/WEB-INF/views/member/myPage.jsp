<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<section class="ftco-section bg-light">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">My Page</span>
				<h2 class="mb-4">마 이 페 이 지</h2>
			</div>
		</div>
		<div class="row block-9"
			style="margin: auto; margin-bottom: 50px; width: 60%;">
			<div>
				<form name="myPageForm" method="post"
					class="p-4 p-md-5 contact-form">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<table>
									<tr>
										<td width="150">이 름</td>
										<td width="300">${vo.name}</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<table>
									<tr>
										<td width="150">아이디</td>
										<td width="300">${vo.member_id}</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<table>
									<tr>
										<td width="150">이메일</td>
										<td width="300">${vo.email}</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<table>
									<tr>
										<td width="150">전화번호</td>
										<td width="300">${vo.phone}</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<table>
									<tr>
										<td width="150">나의 승률</td>
											<td width="300">${vo.win_rate}%</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="col-md-12">

							<div class="form-group">
								<table>
									<tr>
										<td width="150">포인트 잔액</td>
										<td width="300">${vo.point}Point</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div
						style="margin-left: auto; margin-right: auto; margin-top: 20px; margin-bottom: 20px;">
						<div class="form-group" align="center">

							<input type="submit" value="회원수정"
								onclick="javascript:myPageForm.action='${pageContext.request.contextPath}/member/myPageUpdate';"
								id="Update" class="btn btn-primary py-2 px-3"> <input
								type="submit" value="회원탈퇴"
								onclick="javascript:myPageForm.action='${pageContext.request.contextPath}/member/deleteMember';"
								id="Delete" class="btn btn-dark py-2 px-3">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
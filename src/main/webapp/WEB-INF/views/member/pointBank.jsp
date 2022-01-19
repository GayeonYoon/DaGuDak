<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<c:if test="${chargePoint  eq '실패' }">
	<script>
		alert("비밀번호가 맞지 않습니다.");
	</script>
</c:if>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	var IMP = window.IMP;
	IMP.init("imp89273076"); // 식별코드

	function requestPay() {
		var point = document.charge.point.value *= 1;
		var msg;
		/* IMP.request_pay(param, callback) 호출 */
		IMP.request_pay({ // param
			pg : "html5_inicis", // 이니시스웹표준 
			escrow : "true",
			merchant_uid : "",
			name : "포인트",
			amount : point

		}, function(rsp) { // callback
			if (rsp.success) {
				// jQuery로 HTTP 요청
				jQuery.ajax({
					url : "http://localhost:8089/DaGuDak/member/pointBank",
					method : "POST",
					headers : {
						"Content-Type" : "application/json"
					},
					data : {
						imp_uid : rsp.imp_uid, // 거래 고유 번호 : 아임포트 서버에서 결제 정보 조회 
						merchant_uid : rsp.merchant_uid, // 가맹점 주문번호 : 가맹점의 데이터베이스에서 주문 정보 조회
						name : rsp.name,
						amount : rsp.amount
					}
				}).done(function(data) {
					msg = String(point) + "포인트가 충전되었습니다.";
					alert(msg);
					$("#chargeFrm").submit();
				})
			} else {
				msg = "충전에 실패하였습니다. " + rsp.error_msg;
				alert(msg);
			}
		});
	}
</script>

<section class="ftco-section contact-section ftco-no-pb"
	id="contact-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">POINT BANK</span>
				<h2 class="mb-4">포인트 충전</h2>
				<p>포인트 잔액 : ${vo.point } Point</p>
			</div>
		</div>

		<div class="row block-9"
			style="margin: auto; margin-bottom: 50px; padding: 0 calc(50% - 200px);">
			<div>
				<form name="charge"
					action="${pageContext.request.contextPath}/member/pointBank"
					method="post" id="chargeFrm" name="chargeFrm"
					class="p-4 p-md-5 contact-form">
					<div class="row">

						<div class="col-md-12">
							<div class="form-group">
								<input type="text" id="point" name="point" class="form-control"
									placeholder="충전할 포인트 입력" required>
							</div>
						</div>

						<div
							style="margin-left: auto; margin-right: auto; margin-top: 20px;">
							<div class="form-group">
								<input type="button" onclick="requestPay()" id="btnChargePoint"
									name="btnChargePoint" value="충전하기"
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
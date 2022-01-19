<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="mx-5" align="center">
	<ul class="comment-list">
		<!-- form -->
		<li class="comment">
			<div class="" align="center">
				<form name="commentDelete" method="post"
					action="${pageContext.request.contextPath}/comment/delete" class="contact-form">
					
					<input type="password" name="cmt_password" class="form-control mr-1" style="font-size: 15px; width: 30%; float: left;" maxlength="16"
						placeholder="비밀번호" required>
					<input type="hidden" name="bno" value="${bno }">
					<input type="hidden" name="cmtno" value="${cmtno }">
					<div class="comment-body" style="width: 80px;">
					
					<button onclick="document.getElement('commentDelete').submit()" class="reply mt-2"
							style="border-color: transparent;">댓글 삭제</button>
					</div>
				</form>
			</div>
		</li>
	</ul>
</div>
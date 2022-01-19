<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="mx-5" align="center">
	<ul class="comment-list">
		<!-- form -->
		<li class="comment">
			<div class="" align="center">
				<form name="commentUpdate" method="post"
					action="${pageContext.request.contextPath}/comment/update"
					class="contact-form">
					<input type="text" name="cmt_writer" class="form-control mr-1" style="font-size: 15px; width: 30%; float: left;" maxlength="16"
						value="${cmt.cmt_writer}" placeholder="닉네임" required>
						<input type="password" name="cmt_password" class="form-control" style="font-size: 15px; width: 30%; float: left;" maxlength="16"
						placeholder="비밀번호" required>
					<textarea name="cmt_content" class="form-control mt-1"  style="font-size: 15px; float: left;"
					placeholder="댓글 내용" required>${cmt.cmt_content}</textarea>
					
					<div class="comment-body">
						<button onclick="document.getElement('commentUpdate').submit()" class="reply mt-1"
							style="border-color: transparent; float: right;">댓글 수정</button>
					</div>
					<input type="hidden" name="bid" value="${cmt.bid }">
					<input type="hidden" name="bno" value="${cmt.bno }">
					<input type="hidden" name="cmtno" value="${cmt.cmtno }">
				</form>
			</div>
		</li>
	</ul>
</div>
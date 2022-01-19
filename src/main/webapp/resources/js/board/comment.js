//댓글 목록, content.jsp 실행 시
function commentList(bid, bno) {
	$.ajax({
		type: "get",
		url: "/DaGuDak/comment/list?bid=" + bid + "&bno=" + bno,
		success: function(list){
		//responseText가 result에 저장됨.
			$("#commentList").html(list);
		}
	});
}

//댓글 수정버튼 클릭 시,
function commentUpdate(cmtno, status) {
	$.ajax({
		type: "get",
		url: "/DaGuDak/comment/updateForm?cmtno=" + cmtno,
		success: function(comment){
		//responseText가 result에 저장됨.
			$("#updateForm"+status).html(comment);
		}
	});
}


//댓글 삭제버튼 클릭 시,
function commentDelete(cmtno, bno, status) {
	$.ajax({
		type: "get",
		url: "/DaGuDak/comment/deleteForm?cmtno=" + cmtno + "&bno=" + bno,
		success: function(comment){
		//responseText가 result에 저장됨.
			$("#deleteForm"+status).html(comment);
		}
	});
}
//댓글 목록 - 전통적인 Controller 방식
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
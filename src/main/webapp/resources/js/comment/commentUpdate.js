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
function writeBtn(bid, bno) {
	location.href='insert?bid=' + bid + '&bno='+bno
}

$(document).ready(function(){
	$("#btnWrite").on("click", function(){
		location.href = "/DaGuDak/board/write/";
	});
});
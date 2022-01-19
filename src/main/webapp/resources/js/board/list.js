function listBtn(bid, curPage, searchOption, keyword) {
	location.href="/DaGuDak/board/list?bid=" + bid + "&curPage=" + curPage + "&searchOption=" + searchOption +"&keyword=" + keyword;
};

function bettingHistoryBtn(race_no, curPage, searchOption, keyword){
	location.href="/DaGuDak/bet/bettingHistory?race_No=" + race_no + "&curPage=" + curPage + "&searchOption=" + searchOption +"&keyword=" + keyword;
};

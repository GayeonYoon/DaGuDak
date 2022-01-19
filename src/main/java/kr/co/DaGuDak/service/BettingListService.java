package kr.co.DaGuDak.service;

import java.util.List;

import kr.co.DaGuDak.model.BettingListVO;

public interface BettingListService {

	public void insertBetting(BettingListVO bettingListVo) throws Exception;

	public int totalBettingPoint(int race_No) throws Exception;

	public int horseTotalBettingPoint(int race_No, int horseNo) throws Exception;

	public List<BettingListVO> bettingIdList(int race_no, int horseNo) throws Exception;
	
	public int countBettingHistory(int race_No, String searchOption, String keyword) throws Exception;

	public List<BettingListVO> bettingList(int start, int end, String searchOption, String keyword, int race_No) throws Exception;

}

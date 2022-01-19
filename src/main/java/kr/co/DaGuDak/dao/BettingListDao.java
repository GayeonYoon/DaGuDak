package kr.co.DaGuDak.dao;

import java.util.List;
import java.util.Map;

import kr.co.DaGuDak.model.BettingListVO;

public interface BettingListDao {

	public void insertBetting(BettingListVO bettingListVo) throws Exception;

	public int totalBettingPoint(int race_No) throws Exception;

	public int horseTotalBettingPoint(Map<String, Integer> map) throws Exception;

	public int countBettingHistory(int race_No, String searchOption, String keyword) throws Exception;

	public List<BettingListVO> bettingList(int start, int end, String searchOption, String keyword, int race_No) throws Exception;

	public List<BettingListVO> bettingIdList(Map<String, Integer> map) throws Exception;

}

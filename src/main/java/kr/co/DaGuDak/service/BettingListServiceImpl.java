package kr.co.DaGuDak.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.DaGuDak.dao.BettingListDao;
import kr.co.DaGuDak.model.BettingListVO;

@Service
public class BettingListServiceImpl implements BettingListService{
	
	@Inject
	BettingListDao dao;

	@Override
	public void insertBetting(BettingListVO bettingListVo) throws Exception {
		dao.insertBetting(bettingListVo);
	}

	@Override
	public int totalBettingPoint(int race_No) throws Exception {
		return dao.totalBettingPoint(race_No);
	}

	@Override
	public int horseTotalBettingPoint(int race_No, int horseNo) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("race_No", race_No);
		map.put("horseNo", horseNo);
		return dao.horseTotalBettingPoint(map);
	}

	@Override
	public List<BettingListVO> bettingIdList(int race_no, int horseNo) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("race_No", race_no);
		map.put("horseNo", horseNo);
		return dao.bettingIdList(map);
	}
	

	@Override
	public int countBettingHistory(int race_No, String searchOption, String keyword) throws Exception {
		return dao.countBettingHistory(race_No, searchOption, keyword);
		
	}

	@Override
	public List<BettingListVO> bettingList(int start, int end, String searchOption, String keyword, int race_No)
			throws Exception {
		return dao.bettingList(start,end,searchOption,keyword,race_No);
	}

}

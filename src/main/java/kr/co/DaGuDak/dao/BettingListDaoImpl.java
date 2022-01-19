package kr.co.DaGuDak.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.DaGuDak.model.BettingListVO;

@Repository
public class BettingListDaoImpl implements BettingListDao {

	@Inject
	SqlSession sqlSession;

	@Override
	public void insertBetting(BettingListVO bettingListVo) throws Exception {
		sqlSession.insert("bettingList.insert", bettingListVo);

	}

	@Override
	public int totalBettingPoint(int race_No) throws Exception {
		Integer result = sqlSession.selectOne("bettingList.totalBettingPoint", race_No);
		if (result == null)
			result = 0;
		return result;
	}

	@Override
	public int horseTotalBettingPoint(Map<String, Integer> map) throws Exception {
		Integer result = sqlSession.selectOne("bettingList.horseTotalBettingPoint", map);
		if (result == null)
			result = 0;
		return result;
	}

	@Override
	public List<BettingListVO> bettingIdList(Map<String, Integer> map) throws Exception {
		return sqlSession.selectList("bettingList.bettingIdList", map);
	}

	@Override
	public int countBettingHistory(int race_No, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("race_no", race_No);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("bettingList.countBettingHistory", map);
	}

	@Override
	public List<BettingListVO> bettingList(int start, int end, String searchOption, String keyword, int race_No)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("race_no", race_No);
		
		return sqlSession.selectList("bettingList.listAll", map);
	}

}

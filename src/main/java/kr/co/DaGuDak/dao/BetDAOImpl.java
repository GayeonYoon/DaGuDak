package kr.co.DaGuDak.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.DaGuDak.model.RaceBetVO;

@Repository
public class BetDAOImpl implements BetDAO{

	@Inject
	SqlSession sqlSession;

	@Override
	public RaceBetVO selectedRaceList(int race_No) throws Exception {
		return sqlSession.selectOne("bet.selectedRaceList", race_No);
	}
}

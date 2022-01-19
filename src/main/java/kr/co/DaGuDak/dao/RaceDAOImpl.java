package kr.co.DaGuDak.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.DaGuDak.model.RaceVO;
import kr.co.DaGuDak.model.RaceResultVO;

@Repository
public class RaceDAOImpl implements RaceDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public int isNewGame() throws Exception {
		return sqlSession.selectOne("race.isNewGame");
	}

	@Override
	public void createRace(RaceVO vo) throws Exception {
		sqlSession.insert("race.insertRace", vo);
	}

	@Override
	public void createRaceNew(RaceVO vo) throws Exception {
		sqlSession.insert("race.createRaceNew", vo);
	}

	@Override
	public List<Object> raceList() throws Exception {
		return sqlSession.selectList("race.raceList");
	}

	@Override
	public RaceResultVO raceResult(int race_No) throws Exception {
		return sqlSession.selectOne("race.raceResult", race_No);
	}

	@Override
	public RaceVO selectedRaceList(int race_no) throws Exception {
		return sqlSession.selectOne("race.selectedRaceList", race_no);
	}

	@Override
	public void updateRaceResult(int race_no, String isEnd, int first_place, int second_place, int third_place) {
		RaceVO raceVO = new RaceVO();
		raceVO.setRace_No(race_no);
		raceVO.setIsEnd(isEnd);
		raceVO.setFirst_Place(first_place);
		raceVO.setSecond_Place(second_place);
		raceVO.setThird_Place(third_place);

		sqlSession.update("race.updateRaceResult", raceVO);

	}

	@Override
	public Integer fastestGameSearch_client() throws Exception {
		Integer result = sqlSession.selectOne("race.fastestGameSearchToING");
		if (result == null) {
			result = sqlSession.selectOne("race.fastestGameSearchToSoon");
		}

		return result;
	}

	@Override
	public Integer fastestGameSearch_admin() throws Exception {
		Integer result = sqlSession.selectOne("race.fastestGameSearchToING");
		if (result == null) {
			result = sqlSession.selectOne("race.fastestGameSearchToSoon");
			if (result == null) {
				result = sqlSession.selectOne("race.fastestGameSearchToN");
			}
		}

		return result;
	}

	@Override
	public void updateRaceStateNToSoon(int race_no) throws Exception {
		sqlSession.update("race.raceStateNToSoon", race_no);
	}

	@Override
	public String whatState(int race_no) throws Exception {
		String result = sqlSession.selectOne("race.whatState", race_no);
		return result;
	}

	@Override
	public void updateRaceStateSoonToIng(int race_no) throws Exception {
		sqlSession.update("race.updateRaceStateSoonToIng", race_no);
	}

	@Override
	public void updateRaceNextGame() throws Exception {

		sqlSession.update("race.updateRaceNextGame");
	}

}

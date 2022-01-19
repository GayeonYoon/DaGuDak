package kr.co.DaGuDak.dao;

import java.util.List;

import kr.co.DaGuDak.model.RaceVO;
import kr.co.DaGuDak.model.RaceResultVO;

public interface RaceDAO {

	public int isNewGame() throws Exception;
	
	public void createRace(RaceVO vo) throws Exception;
	
	public void createRaceNew(RaceVO vo) throws Exception;

	public List<Object> raceList() throws Exception;

	public RaceResultVO raceResult(int race_No) throws Exception;

	public RaceVO selectedRaceList(int race_no) throws Exception;

	public void updateRaceResult(int race_no, String isEnd, int first_place, int second_place, int third_place)
			throws Exception;

	public Integer fastestGameSearch_client() throws Exception;

	public Integer fastestGameSearch_admin() throws Exception;

	public void updateRaceStateNToSoon(int race_no) throws Exception;

	public String whatState(int race_no) throws Exception;

	public void updateRaceStateSoonToIng(int race_no) throws Exception;

	public void updateRaceNextGame() throws Exception;


}

package kr.co.DaGuDak.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.co.DaGuDak.model.RaceVO;
import kr.co.DaGuDak.model.RaceResultVO;

public interface RaceService {

	public int isNewGame() throws Exception;
	
	public void createRace(ArrayList<Integer> selectedHorses, Date resultDate) throws Exception;

	public void createRaceNew(ArrayList<Integer> selectedHorses, Date resultDate) throws Exception;
	
	public List<Object> raceList() throws Exception;

	public RaceResultVO resultRace(int race_No) throws Exception;

	public RaceVO selectedRaceList(int race_no) throws Exception;

	public void updateRaceResult(int race_no, String isEnd, int first_place, int second_place, int third_place) throws Exception;

	public Integer fastestGameSearch_client() throws Exception;

	public Integer fastestGameSearch_admin() throws Exception;

	public void updateRaceStateNToSoon(int race_no) throws Exception;

	public String whatState(int race_no) throws Exception;

	public void updateRaceStateSoonToIng(int race_no) throws Exception;

	public void updateRaceNextGame() throws Exception;

	

}

package kr.co.DaGuDak.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.DaGuDak.dao.RaceDAO;
import kr.co.DaGuDak.model.RaceVO;
import kr.co.DaGuDak.model.RaceResultVO;

@Service
public class RaceServiceImpl implements RaceService {

	
	@Inject
	RaceDAO dao;

	@Override
	public int isNewGame() throws Exception {
		return dao.isNewGame();
	}


	@Override
	public void createRaceNew(ArrayList<Integer> selectedHorses, Date resultDate) throws Exception {
		RaceVO vo = new RaceVO();

		vo.setFirst_Horse(selectedHorses.get(0));
		vo.setSecond_Horse(selectedHorses.get(1));
		vo.setThird_Horse(selectedHorses.get(2));
		vo.setFourth_Horse(selectedHorses.get(3));
		vo.setFifth_Horse(selectedHorses.get(4));
		vo.setRace_Date(resultDate);
		vo.setIsEnd("SOON");
		
		dao.createRaceNew(vo);
		
		
	}

	
	@Override
	public void createRace(ArrayList<Integer> selectedHorses, Date resultDate) throws Exception {
		RaceVO vo = new RaceVO();

		vo.setFirst_Horse(selectedHorses.get(0));
		vo.setSecond_Horse(selectedHorses.get(1));
		vo.setThird_Horse(selectedHorses.get(2));
		vo.setFourth_Horse(selectedHorses.get(3));
		vo.setFifth_Horse(selectedHorses.get(4));
		vo.setRace_Date(resultDate);

		dao.createRace(vo);

	}

	@Override
	public List<Object> raceList() throws Exception {

		return dao.raceList();
	}

	@Override
	public RaceResultVO resultRace(int race_No) throws Exception {
		return dao.raceResult(race_No);
	}

	@Override
	public RaceVO selectedRaceList(int race_no) throws Exception {

		return dao.selectedRaceList(race_no);
	}

	@Override
	public void updateRaceResult(int race_no, String isEnd, int first_place, int second_place, int third_place)
			throws Exception {
		dao.updateRaceResult(race_no, isEnd, first_place, second_place, third_place);

	}

	@Override
	public Integer fastestGameSearch_client() throws Exception {
		return dao.fastestGameSearch_client();
	}

	@Override
	public Integer fastestGameSearch_admin() throws Exception {
		return dao.fastestGameSearch_admin();
	}

	@Override
	public void updateRaceStateNToSoon(int race_no) throws Exception {
		dao.updateRaceStateNToSoon(race_no);
	}

	@Override
	public String whatState(int race_no) throws Exception {
		return dao.whatState(race_no);
		
	}

	@Override
	public void updateRaceStateSoonToIng(int race_no) throws Exception {
		dao.updateRaceStateSoonToIng(race_no);
		
	}

	@Override
	public void updateRaceNextGame() throws Exception {
		dao.updateRaceNextGame();
		
	}


	
}

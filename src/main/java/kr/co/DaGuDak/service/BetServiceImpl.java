package kr.co.DaGuDak.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.DaGuDak.dao.BetDAO;
import kr.co.DaGuDak.model.RaceBetVO;
import kr.co.DaGuDak.model.RaceVO;

@Service
public class BetServiceImpl implements BetService{

	@Inject
	BetDAO dao;

	@Override
	public RaceBetVO selectedRaceList(int race_No) throws Exception {
		return dao.selectedRaceList(race_No);
	}
}

package kr.co.DaGuDak.service;

import java.util.List;

import kr.co.DaGuDak.model.HorseVO;

public interface HorseService {

	public List<HorseVO> horseList();
	
	public void create(HorseVO vo) throws Exception;

	public HorseVO read(int horse_no) throws Exception;

	public boolean update(HorseVO vo) throws Exception;

	public boolean delete(int horse_no) throws Exception;

	public void updateWin(int horse_no) throws Exception;

	public void updateGames(int horse_no) throws Exception;

}

package kr.co.DaGuDak.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.DaGuDak.dao.HorseDAO;
import kr.co.DaGuDak.model.HorseVO;

@Service
public class HorseServiceImpl implements HorseService{
   
   @Inject
   HorseDAO horseDao;

   @Override
   public List<HorseVO> horseList() {
      List<HorseVO> horsesList = new ArrayList<HorseVO>();
      horsesList = horseDao.horseList();
      return horsesList;
   }

   @Override
   public void create(HorseVO vo) throws Exception {
      String speed = "" + vo.getSpeed1() + vo.getSpeed2() + vo.getSpeed3() + vo.getSpeed4();
      vo.setSpeed(speed);
      horseDao.create(vo);
   }

   @Override
   public HorseVO read(int horse_no) throws Exception {
      return horseDao.read(horse_no);
   }

   @Override
   public boolean update(HorseVO vo) throws Exception {
      String speed = "" + vo.getSpeed1() + vo.getSpeed2() + vo.getSpeed3() + vo.getSpeed4();
      vo.setSpeed(speed);
      return horseDao.update(vo);
   }

	@Override
	public boolean delete(int horse_no) throws Exception {
		return horseDao.delete(horse_no);
	}

	@Override
	public void updateWin(int horse_no) throws Exception {
		horseDao.updateWin(horse_no);
		
	}

	@Override
	public void updateGames(int horse_no) throws Exception {
		horseDao.updateGames(horse_no);
		
	}

}
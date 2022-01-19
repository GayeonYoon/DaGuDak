package kr.co.DaGuDak.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.DaGuDak.model.HorseVO;

@Repository
public class HorseDAOImpl implements HorseDAO{
   
   @Inject
   SqlSession sqlSession;

   @Override
   public List<HorseVO> horseList() {
      return sqlSession.selectList("horse.horseList");
   }

   @Override
   public void create(HorseVO vo) throws Exception {
	   sqlSession.insert("horse.insertHorse", vo);
   }

   @Override
   public HorseVO read(int horse_no) throws Exception {
      return sqlSession.selectOne("horse.readHorse", horse_no);
   }

   @Override
   public boolean update(HorseVO vo) throws Exception {
      int result = sqlSession.insert("horse.updateHorse", vo);
      return result == 1 ? true : false;
   }

	@Override
	public boolean delete(int horse_no) throws Exception {
		int result = sqlSession.delete("horse.deleteHorse", horse_no);
		return result == 1 ? true : false;
	}

	@Override
	public void updateWin(int horse_no) throws Exception {
		sqlSession.update("horse.updateWin", horse_no);
		
	}

	@Override
	public void updateGames(int horse_no) throws Exception {
		sqlSession.update("horse.updateGames", horse_no);
		
	}

}
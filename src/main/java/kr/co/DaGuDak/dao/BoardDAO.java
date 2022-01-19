package kr.co.DaGuDak.dao;

import java.util.List;

import kr.co.DaGuDak.model.BoardVO;

public interface BoardDAO {
	public void create(BoardVO vo) throws Exception;

	public BoardVO read(int bid, int bno) throws Exception;

	public boolean update(BoardVO vo) throws Exception;

	public boolean delete(BoardVO vo) throws Exception;

	public void increaseViewcnt(int bid, int bno) throws Exception;

	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword, int bid) throws Exception;

	public int countArticle(int bid, String searchOption, String keyword) throws Exception;
	
}

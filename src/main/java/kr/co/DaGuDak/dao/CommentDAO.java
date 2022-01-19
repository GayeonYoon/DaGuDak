package kr.co.DaGuDak.dao;

import java.util.List;

import kr.co.DaGuDak.model.CommentVO;

public interface CommentDAO {
	
	public List<CommentVO> list(int bid, int bno) throws Exception;

	public void create(CommentVO vo) throws Exception;
	
	public CommentVO read(int cmtno) throws Exception;

	public boolean update(CommentVO vo) throws Exception;

	public boolean delete(int cmtno, String cmt_password) throws Exception;
}
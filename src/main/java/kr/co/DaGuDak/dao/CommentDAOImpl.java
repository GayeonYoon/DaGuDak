package kr.co.DaGuDak.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.DaGuDak.model.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<CommentVO> list(int bid, int bno) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bid", bid);
		map.put("bno", bno);
		return sqlSession.selectList("comment.listComments", map);
	}

	@Override
	public void create(CommentVO vo) throws Exception {
		sqlSession.insert("comment.insertComment", vo);
	}
	
	@Override
	public CommentVO read(int cmtno) throws Exception {
		return sqlSession.selectOne("comment.selectComment", cmtno);
	}

	@Override
	public boolean update(CommentVO vo) throws Exception {
		int result = sqlSession.insert("comment.updateComment", vo);
		return result == 1 ? true : false;
	}

	@Override
	public boolean delete(int cmtno, String cmt_password) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("cmtno", cmtno);
		map.put("cmt_password", cmt_password);
		int result = sqlSession.insert("comment.deleteComment", map);
		return result == 1 ? true : false;
	}

	
}

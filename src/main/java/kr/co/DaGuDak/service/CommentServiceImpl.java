package kr.co.DaGuDak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.DaGuDak.dao.CommentDAO;
import kr.co.DaGuDak.model.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	CommentDAO commentDao;

	@Override
	public List<CommentVO> list(int bid, int bno) throws Exception {
		return commentDao.list(bid, bno);
	}

	@Override
	public void create(CommentVO vo) throws Exception {
		String cmt_writer = vo.getCmt_writer();
		String cmt_content = vo.getCmt_content();

		cmt_writer = cmt_writer.replace("<", "&lt;");
		cmt_writer = cmt_writer.replace(">", "&gt;");
		cmt_content = cmt_content.replace("<", "&lt;");
		cmt_content = cmt_content.replace(">", "&gt;");

		cmt_writer = cmt_writer.replace("  ", "&nbsp;&nbsp;");
		cmt_content = cmt_content.replace("  ", "&nbsp;&nbsp;");
		cmt_content = cmt_content.replace("\n", "<br>");
		
		vo.setCmt_writer(cmt_writer);
		vo.setCmt_content(cmt_content);
		
		commentDao.create(vo);
	}
	
	@Override
	public CommentVO read(int cmtno) throws Exception {
		return commentDao.read(cmtno);
	}

	@Override
	public boolean update(CommentVO vo) throws Exception {
		String cmt_writer = vo.getCmt_writer();
		String cmt_content = vo.getCmt_content();

		cmt_writer = cmt_writer.replace("<", "&lt;");
		cmt_writer = cmt_writer.replace(">", "&gt;");
		cmt_content = cmt_content.replace("<", "&lt;");
		cmt_content = cmt_content.replace(">", "&gt;");

		cmt_writer = cmt_writer.replace("  ", "&nbsp;&nbsp;");
		cmt_content = cmt_content.replace("  ", "&nbsp;&nbsp;");
		cmt_content = cmt_content.replace("\n", "<br>");
		
		vo.setCmt_writer(cmt_writer);
		vo.setCmt_content(cmt_content);
		
		return commentDao.update(vo);
	}

	@Override
	public boolean delete(int cmtno, String cmt_password) throws Exception {
		return commentDao.delete(cmtno, cmt_password);
	}
}

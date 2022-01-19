package kr.co.DaGuDak.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.DaGuDak.model.BoardVO;

public interface BoardService {
	public void create(BoardVO vo, HttpServletRequest request) throws Exception;

	public BoardVO read(int bid, int bno) throws Exception;

	public boolean update(BoardVO vo, HttpServletRequest request) throws Exception;

	public boolean delete(BoardVO vo) throws Exception;

	public void increaseViewCnt(int bid, int bno, HttpSession session) throws Exception;

	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword, int bid) throws Exception;

	public int countArticle(int bid, String searchOption, String keyword) throws Exception;

	public void insertFile(BoardVO vo, HttpServletRequest request) throws IllegalStateException, IOException;
}

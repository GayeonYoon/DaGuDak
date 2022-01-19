package kr.co.DaGuDak.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.DaGuDak.model.BoardPager;
import kr.co.DaGuDak.model.BoardVO;
import kr.co.DaGuDak.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	BoardService boardService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam int bid, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		//bid가 null로 들어올 때는 변수 타입이 달라서, list() 자체가 실행되지 못하고 오류남
		if(bid != 1 && bid != 2 && bid != 3 && bid != 4) {
			mav.setViewName("home");
			return mav;
		}
		
		session.setAttribute("bid", bid);

		int count = boardService.countArticle(bid, searchOption, keyword);
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword, bid);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);
		map.put("curPage", curPage);

		mav.addObject("map", map);
		mav.setViewName("board/list");
		
		return mav;
	}

	@RequestMapping(value = "list", method = RequestMethod.POST)
	public ModelAndView list(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage,  HttpSession session)
			throws Exception {
		int bid = (int) session.getAttribute("bid");
		ModelAndView mav = new ModelAndView();

		int count = boardService.countArticle(bid, searchOption, keyword);
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();

		List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword, bid);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);
		map.put("curPage", curPage);

		mav.addObject("map", map);
		mav.setViewName("board/list");

		return mav;
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public ModelAndView write(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("curPage", curPage);
		mav.addObject("map", map);
		mav.setViewName("board/write");
		return mav;
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo, HttpServletRequest request) throws Exception {

		// pom.xml에 멀티파트 디펜던시 추가함
		// list.jsp에 input hidden 값으로 bid 고정시켜둠. 세션처리 후 jsp 수정
		boardService.create(vo, request);
		return "redirect:list?bid=" + vo.getBid();
	}

	@RequestMapping(value = "content", method = RequestMethod.GET)
	public ModelAndView content(@RequestParam("bno") int bno, @RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage,
			HttpSession session) throws Exception {
		int bid = (int) session.getAttribute("bid");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		if(bid != 2)
			boardService.increaseViewCnt(bid, bno, session);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("curPage", curPage);
		mav.addObject("map", map);
		mav.setViewName("board/content");
		mav.addObject("dto", boardService.read(bid, bno));
		
		return mav;
	}

	@RequestMapping(value = "updateForm", method = RequestMethod.GET)
	public ModelAndView uppdateForm(@RequestParam("bno") int bno,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage,
			HttpSession session) throws Exception {
		int bid = (int) session.getAttribute("bid");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("curPage", curPage);
		mav.addObject("map", map);
		mav.setViewName("board/update");
		
		mav.addObject("dto", boardService.read(bid, bno));
		return mav;
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute BoardVO vo, RedirectAttributes ra, HttpServletRequest request) throws Exception {
		String url = "";
		RedirectView rv = new RedirectView();
		boolean updatePasswordCheck = boardService.update(vo, request);
		ra.addFlashAttribute("updatePasswordCheck", updatePasswordCheck);
		if (updatePasswordCheck) {
			url = "content?bno=" + vo.getBno();
			rv.setUrl(url);
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		} else {
			url = "updateForm?bno=" + vo.getBno();
			rv.setUrl(url);
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		}
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute BoardVO vo, RedirectAttributes ra) throws Exception {
		String url = "";
		RedirectView rv = new RedirectView();
		
		boolean deletePasswordCheck = boardService.delete(vo);
		ra.addFlashAttribute("deletePasswordCheck", deletePasswordCheck);

		if (deletePasswordCheck) {
			url = "list?bid=" + vo.getBid();
			rv.setUrl(url);
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		} else {
			url = "content?bno=" + vo.getBno();
			rv.setUrl(url);
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		}
	}
	
	
}

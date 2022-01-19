package kr.co.DaGuDak.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.DaGuDak.model.CommentVO;
import kr.co.DaGuDak.service.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

	@Inject
	CommentService commentService;

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute CommentVO vo, RedirectAttributes ra, HttpSession session)
			throws Exception {
		String url = "";
		RedirectView rv = new RedirectView();
		commentService.create(vo);

		url = "/DaGuDak/board/content?bno=" + vo.getBno();
		rv.setUrl(url);
		rv.setExposeModelAttributes(false);
		return new ModelAndView(rv);
	}

	@RequestMapping("list")
	public ModelAndView list(@RequestParam("bid") int bid, @RequestParam("bno") int bno) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<CommentVO> list = commentService.list(bid, bno);
		mav.setViewName("comment/commentList");
		mav.addObject("cmtList", list);
		return mav;
	}

	@RequestMapping(value = "updateForm", method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam("cmtno") int cmtno) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("comment/commentUpdate");
		CommentVO vo = commentService.read(cmtno);
		if (vo != null)
			mav.addObject("cmt", vo);
		else
			mav.setViewName("comment/commentList");
		return mav;
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute CommentVO vo, RedirectAttributes ra, HttpSession session)
			throws Exception {

		// 수정 버튼 눌렀을때 cmtno 넘어오게 하는 방법 생각해보기
		String url = "";
		RedirectView rv = new RedirectView();

		boolean cmtUpdatePasswordCheck = commentService.update(vo);
		ra.addFlashAttribute("cmtUpdatePasswordCheck", cmtUpdatePasswordCheck);

		url = "/DaGuDak/board/content?bno=" + vo.getBno();
		rv.setUrl(url);
		rv.setExposeModelAttributes(false);

		return new ModelAndView(rv);

	}
	@RequestMapping(value = "deleteForm", method = RequestMethod.GET)
	public ModelAndView deleteForm(@RequestParam("cmtno") int cmtno, @RequestParam("bno") int bno) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("comment/commentDelete");
		mav.addObject("cmtno", cmtno);
		mav.addObject("bno", bno);
		return mav;
	}
	
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute("cmtno") int cmtno, @ModelAttribute("cmt_password") String cmt_password,
			@ModelAttribute("bno") int bno, RedirectAttributes ra, HttpSession session) throws Exception {
		String url = "";
		RedirectView rv = new RedirectView();

		boolean cmtDeletePasswordCheck = commentService.delete(cmtno, cmt_password);

		ra.addFlashAttribute("cmtDeletePasswordCheck", cmtDeletePasswordCheck);

		url = "/DaGuDak/board/content?bno=" + bno;
		rv.setUrl(url);
		rv.setExposeModelAttributes(false);

		return new ModelAndView(rv);
	}

}

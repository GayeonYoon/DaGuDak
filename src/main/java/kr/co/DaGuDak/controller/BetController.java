package kr.co.DaGuDak.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.DaGuDak.model.BettingListVO;
import kr.co.DaGuDak.model.BoardPager;
import kr.co.DaGuDak.model.MemberVO;
import kr.co.DaGuDak.model.RaceBetVO;
import kr.co.DaGuDak.service.BetService;
import kr.co.DaGuDak.service.BettingListService;
import kr.co.DaGuDak.service.MemberService;

@Controller
@RequestMapping("/bet/*")
public class BetController {

	@Inject
	BetService betService;

	@Inject
	MemberService memberService;

	@Inject
	BettingListService bettingListService;

	@RequestMapping(value = "betting", method = RequestMethod.GET)
	public String bettingGet(@RequestParam int race_No, @RequestParam int first_Horse, @RequestParam int second_Horse,
			@RequestParam int third_Horse, @RequestParam int fourth_Horse, @RequestParam int fifth_Horse, Model model,
			HttpSession session) throws Exception {
		RaceBetVO raceInfo = betService.selectedRaceList(race_No);
		String loginId = (String) session.getAttribute("userId");

		int totalBettingPoint = bettingListService.totalBettingPoint(race_No);

		int firstHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_No, first_Horse);
		int secondHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_No, second_Horse);
		int thirdHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_No, third_Horse);
		int fourthHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_No, fourth_Horse);
		int fifthHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_No, fifth_Horse);

		MemberVO vo = memberService.userInfo(loginId);
		model.addAttribute("memberVo", vo);
		model.addAttribute("raceInfo", raceInfo);
		model.addAttribute("totalBettingPoint", totalBettingPoint);
		model.addAttribute("firstHorseTotalBettingPoint", firstHorseTotalBettingPoint);
		model.addAttribute("secondHorseTotalBettingPoint", secondHorseTotalBettingPoint);
		model.addAttribute("thirdHorseTotalBettingPoint", thirdHorseTotalBettingPoint);
		model.addAttribute("fourthHorseTotalBettingPoint", fourthHorseTotalBettingPoint);
		model.addAttribute("fifthHorseTotalBettingPoint", fifthHorseTotalBettingPoint);

		return "bet/betting";
	}

	@RequestMapping(value = "betting", method = RequestMethod.POST)
	public String bettingPost(Model model, HttpSession session, @ModelAttribute BettingListVO bettingListVo)
			throws Exception {

		// 받아온 금액
		String loginId = (String) session.getAttribute("userId");
		MemberVO memberVo = memberService.userInfo(loginId);

		bettingListService.insertBetting(bettingListVo);
		memberService.chargePoint(loginId, memberVo.getPoint() - bettingListVo.getBetting_point());

		memberVo = memberService.userInfo(loginId);

		RaceBetVO raceInfo = betService.selectedRaceList(bettingListVo.getRace_no());

		int totalBettingPoint = bettingListService.totalBettingPoint(bettingListVo.getRace_no());
		int firstHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(bettingListVo.getRace_no(),
				raceInfo.getFirst_Horse());
		int secondHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(bettingListVo.getRace_no(),
				raceInfo.getSecond_Horse());
		int thirdHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(bettingListVo.getRace_no(),
				raceInfo.getThird_Horse());
		int fourthHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(bettingListVo.getRace_no(),
				raceInfo.getFourth_Horse());
		int fifthHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(bettingListVo.getRace_no(),
				raceInfo.getFifth_Horse());

		model.addAttribute("memberVo", memberVo);
		model.addAttribute("raceInfo", raceInfo);

		model.addAttribute("totalBettingPoint", totalBettingPoint);
		model.addAttribute("firstHorseTotalBettingPoint", firstHorseTotalBettingPoint);
		model.addAttribute("secondHorseTotalBettingPoint", secondHorseTotalBettingPoint);
		model.addAttribute("thirdHorseTotalBettingPoint", thirdHorseTotalBettingPoint);
		model.addAttribute("fourthHorseTotalBettingPoint", fourthHorseTotalBettingPoint);
		model.addAttribute("fifthHorseTotalBettingPoint", fifthHorseTotalBettingPoint);

		return "bet/betting";
	}

	@RequestMapping(value = "bettingHistory", method = RequestMethod.GET)
	public ModelAndView bettingHistory(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam("race_No") int race_No) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int count = bettingListService.countBettingHistory(race_No ,searchOption, keyword);
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		List<BettingListVO> list = bettingListService.bettingList(start, end, searchOption, keyword,race_No);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);
		map.put("curPage", curPage);

		mav.addObject("map", map);
		mav.addObject("race_no", race_No);
		mav.setViewName("bet/bettingHistory");
		return mav;
	}
}
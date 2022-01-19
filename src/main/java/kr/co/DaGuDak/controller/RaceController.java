package kr.co.DaGuDak.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.DaGuDak.model.BettingListVO;
import kr.co.DaGuDak.model.HorseVO;
import kr.co.DaGuDak.model.RaceResultVO;
import kr.co.DaGuDak.model.RaceVO;
import kr.co.DaGuDak.service.BettingListService;
import kr.co.DaGuDak.service.HorseService;
import kr.co.DaGuDak.service.MemberService;
import kr.co.DaGuDak.service.RaceService;

@Controller
@RequestMapping("/race/*")
public class RaceController {

	@Inject
	RaceService raceService;

	@Inject
	BettingListService bettingListService;

	@Inject
	HorseService horseService;

	@Inject
	MemberService memberService;

	@RequestMapping(value = "createRace", method = RequestMethod.POST)
	public String createRace(HttpServletRequest request, ModelMap model) throws Exception {
		String[] arr = request.getParameterValues("chkHorse");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date resultDate;

		if (request.getParameter("race_date") != "") {
			String date = request.getParameter("race_date");
			resultDate = transFormat.parse(date.replace("T", " "));
		} else {
			String date = transFormat.format(new Date());
			resultDate = transFormat.parse(date.replace("", ""));
		}

		ArrayList<Integer> selectedHorses = new ArrayList<Integer>();

		for (String temp : arr) {
			selectedHorses.add(Integer.parseInt(temp));
		}
		int isNewGame = raceService.isNewGame();
		if (isNewGame > 0) {
			raceService.createRace(selectedHorses, resultDate);
		} else {
			raceService.createRaceNew(selectedHorses, resultDate);
		}
		return "redirect:racingList";
	}

	@RequestMapping(value = "racingList", method = RequestMethod.GET)
	public String racingList(Locale locale, Model model) throws Exception {

		List<Object> list = raceService.raceList();

		model.addAttribute("list", list);
		return "race/racingList";
	}

	@RequestMapping(value = "racing", method = RequestMethod.GET)
	public String racing(@RequestParam Integer race_no, Model model, HttpSession session) throws Exception {
		// 경기 바로가기
		if (race_no == 0) {
			// 로그인 했다면,
			if (session.getAttribute("userId") != null) {
				String loginId = (String) session.getAttribute("userId");
				if (loginId.equals("admin")) {// admin계정이면
					race_no = raceService.fastestGameSearch_admin();
					if (race_no == null) {
						return "race/todayGameEnd";
					}
					String state = raceService.whatState(race_no);
					if (state.equals("N")) {
						raceService.updateRaceStateNToSoon(race_no);
					} else if (state.equals("SOON")) {
						raceService.updateRaceStateSoonToIng(race_no);
					}
				} else { // 일반 계정이면
					race_no = raceService.fastestGameSearch_client();
					if (race_no == null) {
						return "race/todayGameEnd";
					}
				}
			} else { // 익명이라면
				race_no = raceService.fastestGameSearch_client();
				if (race_no == null) {
					return "race/todayGameEnd";
				}
			}

		}

		// 직접 눌렀을때 admin의 state trigger.
		if (session.getAttribute("userId") != null) {
			String loginId = (String) session.getAttribute("userId");
			if (loginId.equals("admin")) {// admin계정이면
				String state = raceService.whatState(race_no);
				if (state.equals("N")) {
					raceService.updateRaceStateNToSoon(race_no);
				} else if (state.equals("SOON")) {
					raceService.updateRaceStateSoonToIng(race_no);
				}
			}
		}

		RaceVO racingHorseList = (RaceVO) raceService.selectedRaceList(race_no);

		HorseVO firstHorse = horseService.read(racingHorseList.getFirst_Horse());
		HorseVO secondHorse = horseService.read(racingHorseList.getSecond_Horse());
		HorseVO thirdHorse = horseService.read(racingHorseList.getThird_Horse());
		HorseVO fourthHorse = horseService.read(racingHorseList.getFourth_Horse());
		HorseVO fifthHorse = horseService.read(racingHorseList.getFifth_Horse());

		model.addAttribute("racingHorseList", racingHorseList);

		model.addAttribute("firstHorse", firstHorse.getSpeed());
		model.addAttribute("secondHorse", secondHorse.getSpeed());
		model.addAttribute("thirdHorse", thirdHorse.getSpeed());
		model.addAttribute("fourthHorse", fourthHorse.getSpeed());
		model.addAttribute("fifthHorse", fifthHorse.getSpeed());

		return "race/racing";
	}

	@RequestMapping(value = "racingResult", method = RequestMethod.GET)
	public String racingResult(@RequestParam("race_No") int race_No, @RequestParam("first_Place") int first_place,
			@RequestParam("second_Place") int second_place, @RequestParam("third_Place") int third_place, Model model)
			throws Exception {
		RaceResultVO result = raceService.resultRace(race_No);

		int firstHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_No, first_place);
		int secondHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_No, second_place);
		int thirdHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_No, third_place);

		model.addAttribute("result", result);
		model.addAttribute("firstHorseTotalBettingPoint", firstHorseTotalBettingPoint);
		model.addAttribute("secondHorseTotalBettingPoint", secondHorseTotalBettingPoint);
		model.addAttribute("thirdHorseTotalBettingPoint", thirdHorseTotalBettingPoint);

		return "race/racingResult";
	}

	// end game
	@RequestMapping(value = "updateRaceResult", method = RequestMethod.GET)
	public String updateRaceResult(@RequestParam("race_no") int race_no, @RequestParam("isEnd") String isEnd,
			@RequestParam("first_place") int first_place, @RequestParam("second_place") int second_place,
			@RequestParam("third_place") int third_place, @RequestParam("fourth_place") int fourth_place,
			@RequestParam("fifth_place") int fifth_place, Model model, HttpSession session) throws Exception {
		
		if (session.getAttribute("userId") != null) {
			String loginId = (String) session.getAttribute("userId");
			if (loginId.equals("admin")) {// admin계정이면
				raceService.updateRaceResult(race_no, isEnd, first_place, second_place, third_place);
			}
		}

		RaceResultVO result = raceService.resultRace(race_no);

		// 각 말에 베팅된 총액
		int firstHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_no, first_place);
		int secondHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_no, second_place);
		int thirdHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_no, third_place);
		int fourthHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_no, fourth_place);
		int fifthHorseTotalBettingPoint = bettingListService.horseTotalBettingPoint(race_no, fifth_place);

		// 각 말에 베팅한 아이디 리스트
		ArrayList<BettingListVO> first_BettingidList = (ArrayList<BettingListVO>) bettingListService
				.bettingIdList(race_no, first_place);
		ArrayList<BettingListVO> second_BettingidList = (ArrayList<BettingListVO>) bettingListService
				.bettingIdList(race_no, second_place);
		ArrayList<BettingListVO> third_BettingidList = (ArrayList<BettingListVO>) bettingListService
				.bettingIdList(race_no, third_place);
		ArrayList<BettingListVO> fourth_BettingidList = (ArrayList<BettingListVO>) bettingListService
				.bettingIdList(race_no, fourth_place);
		ArrayList<BettingListVO> fifth_BettingidList = (ArrayList<BettingListVO>) bettingListService
				.bettingIdList(race_no, fifth_place);
		// 총상금
		int totalprice = firstHorseTotalBettingPoint + secondHorseTotalBettingPoint + thirdHorseTotalBettingPoint
				+ fourthHorseTotalBettingPoint + fifthHorseTotalBettingPoint;

		if (session.getAttribute("userId") != null) {
			String loginId = (String) session.getAttribute("userId");
			if (loginId.equals("admin")) {// admin계정이면
				raceService.updateRaceNextGame();

				horseService.updateWin(first_place);
				horseService.updateGames(first_place);
				horseService.updateGames(second_place);
				horseService.updateGames(third_place);
				horseService.updateGames(fourth_place);
				horseService.updateGames(fifth_place);

				// 5등의 게임 수 업데이트
				for (BettingListVO bettingListVO : fifth_BettingidList) {
					if (bettingListVO != null) {
						memberService.updateGames(bettingListVO.getMember_id());
					}
				}
				// 4등 게임 수 업데이트
				for (BettingListVO bettingListVO : fourth_BettingidList) {
					if (bettingListVO != null) {
						memberService.updateGames(bettingListVO.getMember_id());
					}
				}

				// 3등 금액 몰수
				for (BettingListVO bettingListVO : third_BettingidList) {
					if (bettingListVO != null) {
						int currentMemberPoint = memberService.getPoint(bettingListVO.getMember_id());
						memberService.chargePoint(bettingListVO.getMember_id(),
								currentMemberPoint + (int) (bettingListVO.getBetting_point() * 0.3));
						memberService.updateGames(bettingListVO.getMember_id());
					}
				}
				// 2등 금액 몰수
				for (BettingListVO bettingListVO : second_BettingidList) {
					if (bettingListVO != null) {
						int currentMemberPoint = memberService.getPoint(bettingListVO.getMember_id());
						memberService.chargePoint(bettingListVO.getMember_id(),
								currentMemberPoint + (int) (bettingListVO.getBetting_point() * 0.5));
						memberService.updateGames(bettingListVO.getMember_id());
					}
				}

				// 1등 상금 분배
				for (BettingListVO bettingListVO : first_BettingidList) {
					if (bettingListVO != null) {
						int currentMemberPoint = memberService.getPoint(bettingListVO.getMember_id());
						// 내가 건 금액 + 내가건 금액의 비율
						memberService.chargePoint(bettingListVO.getMember_id(), (int) (currentMemberPoint
								+ (bettingListVO.getBetting_point() + ((totalprice - bettingListVO.getBetting_point())
										* (bettingListVO.getBetting_point() / (double) totalprice)))));
						memberService.updateWin(bettingListVO.getMember_id());
						memberService.updateGames(bettingListVO.getMember_id());
					}
				}
			}
		}

		model.addAttribute("result", result);
		model.addAttribute("firstHorseTotalBettingPoint", firstHorseTotalBettingPoint);
		model.addAttribute("secondHorseTotalBettingPoint", secondHorseTotalBettingPoint);
		model.addAttribute("thirdHorseTotalBettingPoint", thirdHorseTotalBettingPoint);

		return "race/racingResult";
	}
}

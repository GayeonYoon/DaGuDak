package kr.co.DaGuDak.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.DaGuDak.model.HorseVO;
import kr.co.DaGuDak.service.HorseService;

@Controller
@RequestMapping("/horse/*")
public class HorseController {
	
	@Inject
	HorseService horseService;

	@RequestMapping(value = "horses", method = RequestMethod.GET)
	public String horses(Locale locale, Model model) throws Exception {
		List<HorseVO> horseList = new ArrayList<HorseVO>();
		horseList = horseService.horseList();
		model.addAttribute("horseList", horseList);
		return "horse/horses";
	}
	
	@RequestMapping(value = "horseInfo", method = RequestMethod.GET)
	public ModelAndView horseInfo(@RequestParam("horse_no") int horse_no) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("horse", horseService.read(horse_no));
		mav.setViewName("horse/horseInfo");
		return mav;
	}
	
	@RequestMapping("createForm")
	public String createForm() {
		return "horse/createHorse";
	}
	
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(@ModelAttribute HorseVO vo) throws Exception {
       horseService.create(vo);
       return "redirect:horses";
    }

    @RequestMapping(value = "updateForm", method = RequestMethod.GET)
    public String updateForm(@RequestParam("horse_no") int horse_no, Model model) throws Exception {
       model.addAttribute("horse", horseService.read(horse_no));
       return "horse/updateHorse";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@ModelAttribute HorseVO vo) throws Exception {
       horseService.update(vo);
       return "redirect:horses";
    }
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam("horse_no") int horse_no, RedirectAttributes ra) throws Exception {
		String url = "";
		RedirectView rv = new RedirectView();
		
		boolean result = horseService.delete(horse_no);
		ra.addFlashAttribute("deleteResult", result);
		if (result) {
			url = "horses";
			rv.setUrl(url);
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		} else {
			url = "horsesInfo?horse_no=" + horse_no;
			rv.setUrl(url);
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		}
	}
}

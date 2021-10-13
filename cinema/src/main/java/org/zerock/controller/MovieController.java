package org.zerock.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieVO;
import org.zerock.service.MovieServiceImpl;

@Controller
public class MovieController {
	
	private MovieServiceImpl serviceimpl;
		
		@Autowired(required = false)
		public MovieController(MovieServiceImpl serviceimpl)
		{
			this.serviceimpl = serviceimpl;
		}
		
		@RequestMapping(value="search.do", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
		@ResponseBody
		public String getApi(@RequestParam(defaultValue="") String keyword)
		{
			return serviceimpl.findkeyword(keyword);
		}
		
		
		@RequestMapping("/result") 
		public String result(Model model) 
		{ 
			return "result"; 
		}
		
		
		/*
		@RequestMapping(value="/detail", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
		@ResponseBody
		public String detail(@RequestBody MovieVO getLinkVO, RedirectAttributes rttr) 
		{ 
			//model.addAttribute("link", link);
			String link = getLinkVO.getLink();
			System.out.println("ssssss");
			System.out.println("링크 : " + getLinkVO.getLink());
			rttr.addFlashAttribute("link", link);
			return "detail";
		}
		*/
		
		
		
		@GetMapping("detail.do")
		public String get_detail(@RequestParam("link") String link, Model model) //정보 조회이고 보안상의 문제고려 필요 x => get사용. 
		{ 
			String context = serviceimpl.showDetail(link).getContent();
			ArrayList<String> review = serviceimpl.showDetail(link).getReview();
			String netizen_score = serviceimpl.showDetail(link).getNetizen_score();
			String special_score = serviceimpl.showDetail(link).getSpecial_score();
			String image = serviceimpl.showDetail(link).getImage();
			//String link = mv.getLink();
			model.addAttribute("context", context);
			model.addAttribute("link", link);
			model.addAttribute("review", review);
			model.addAttribute("netizen_score", netizen_score);
			model.addAttribute("special_score", special_score);
			model.addAttribute("image", image);
			System.out.println("ssssss");
			System.out.println("링크 : " + link);
			return "detail"; 
		}
		
		

		
		@RequestMapping(value="result", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
		@ResponseBody
		public String getResult(@RequestParam(defaultValue="") String keyword, Model model) //@RequestParam jsp form 의 name 을 가져옴
		{
			model.addAttribute("keyword", keyword);
			return serviceimpl.findkeyword(keyword);
		}
		
		
//		@GetMapping("/detail")
//		public String detail(Model model)
//		{
//			return "/detail";
//		}
	
}

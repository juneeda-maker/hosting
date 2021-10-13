package org.zerock.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.BoardService;
import org.zerock.service.SignupServiceImpl;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class CinemaController {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	private SignupServiceImpl service;
	
	@RequestMapping("/home") 
	public String home(Model model) 
	{ 
		log.info("home");
		return "home"; 
	}
	
	@RequestMapping("/community")
	public String community(Model model)
	{
		log.info("community");
		return "community";
	}
	
	@RequestMapping("/list")
	public String list(Model model)
	{
		log.info("list");
		return "list";
	}
	
	@GetMapping("/signup")
	public String signup_View(Model model)
	{
		log.info("signup");
		return "signup";
	}
	
	//회원가입시 비밀번호 암호화 
	@PostMapping("/signup")
	public String signup(MemberVO member, RedirectAttributes rttr, @RequestParam("userpw") String userpw)
	{
		log.info("회원가입 : " + member);
		member.setUserpw(pwencoder.encode(userpw));
		service.signup(member);
		rttr.addFlashAttribute("result", member.getUserid());
		
		return "redirect:/home";
	}
	
	
	/*
	@RequestMapping("/customLogin")
	public String loginpage(Model model)
	{
		log.info("customLogin");
		return "customLogin";
	}
	*/
	
	/*
	@GetMapping("/customLogin")
	public void login(String error, String logout, Model model)
	{	
		if(error != null)
		{
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null)
		{
			model.addAttribute("logout", "Logout!!!");
		}
	}
	*/
	
}

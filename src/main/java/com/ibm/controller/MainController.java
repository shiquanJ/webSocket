package com.ibm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
@SpringBootApplication(scanBasePackages = "com.ibm") 
public class MainController {
	public static void main(String[] args) {
		SpringApplication.run(MainController.class, args);
	}
	
	@RequestMapping("/")
	public ModelAndView index(HttpServletRequest req){
	    	
		ModelAndView mv = new ModelAndView();
		/*HttpSession session = req.getSession(true);
		String usernm = (String)session.getAttribute("usernm");
		System.out.println(usernm);
		if(usernm == null ){
			mv.setViewName("/main");
		}else{
			mv.addObject("usernm", usernm);
			mv.setViewName("/view/chat");
		}*/
		mv.setViewName("/view/layout");
		return mv;
			
	}
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest req){
	    	
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession(true);
		String usernm = req.getParameter("usernm");
		
		System.out.println(usernm);
		if(usernm == null){
			mv.setViewName("/index");
		}else{
			session.setAttribute("usernm", usernm);
			mv.setViewName("/view/layout");
		}
			
		return mv;
			
	}
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession(true);
		System.out.println(session.getAttribute("usernm"));
		session.removeAttribute("usernm");
		
		mv.setViewName("/view/layout");
		
		return mv;
		
	}
	@RequestMapping("/layout")
	public ModelAndView layout(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/view/layout");
		
		return mv;
		
	}
}

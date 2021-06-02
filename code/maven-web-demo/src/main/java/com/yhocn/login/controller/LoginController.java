package com.yhocn.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.login.service.LoginService;
import com.yhocn.teacher.entity.Teacher;

@Controller
public class LoginController {

	@Autowired
	private LoginService service;
	
	@RequestMapping("/login")
	public ModelAndView login(Teacher t,HttpSession se,String isRemPwd,HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView();
		Teacher t2 = service.login(t);
		if(t2!=null) {
			if(t2.getUseType()==1) {
				mv.setViewName("/main.jsp");
				se.setAttribute("GLOBAL_USER", t2);
			
				if("true".equals(isRemPwd)) {
					Cookie c1=new Cookie("userName", t.getUserName());
					c1.setMaxAge(10*24*60*60);
					response.addCookie(c1);
					
					Cookie c2=new Cookie("password",t.getPassword());
					c2.setMaxAge(10*24*60*60);
					response.addCookie(c2);
				}else {
					Cookie c1=new Cookie("userName", t.getUserName());
					c1.setMaxAge(0);
					response.addCookie(c1);
				
					Cookie c2=new Cookie("password",t.getPassword());
					c2.setMaxAge(0);
					response.addCookie(c2);}
			}else {
				mv.setViewName("/tea/update.jsp");
				se.setAttribute("GLOBAL_USER", t2);
			}
			
		}else {
			mv.setViewName("/login.jsp");
			mv.addObject("msg","用户名或者密码错误");
		}
		return mv;
	}
	
	
}

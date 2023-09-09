package com.yhocn.kstj.controller;

import com.yhocn.kstj.entity.Kstj;

import com.yhocn.kstj.service.KstjService;
import com.yhocn.teacher.entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import com.yhocn.login.controller.LoginController;

@Controller
@RequestMapping("/teacher")
public class KstjController {


	@Autowired
	private KstjService service;

	@RequestMapping("/kstj")
	public ModelAndView query(ModelAndView mv, Kstj t, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		List<Kstj> tclist = service.selectAll(t,c);
		mv.addObject("tclist",tclist);
		mv.setViewName("/teacher/kstj.jsp");
		return mv;
	}


	@RequestMapping("/toalter")
	public ModelAndView toalter(ModelAndView mv,Kstj t, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		Kstj t2 = service.selectById(t,c);
		mv.addObject("kstj",t2);
		mv.setViewName("/teacher/alter.jsp");
		return mv;
	}
	@RequestMapping("/alter")
	public ModelAndView alter(ModelAndView mv,Kstj t, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.alter(t,c);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/teacher/kstj.action");
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/teacher/kstj.action");
		}
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv, Kstj t, HttpSession se, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.update(t,c);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/teacher/update.jsp");
			se.setAttribute("GLOBAL_USER", t);
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/teacher/update.jsp");
		}
		return mv;
	}
	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView mv,Kstj t, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.delete(t,c);
		if(i>0) {
			mv.addObject("msg","删除用户成功");
		}else {
			mv.addObject("msg","删除用户失败");
		}
		mv.setViewName("/teacher/kstj.action");
		return mv;
	}
	@RequestMapping("/add")
	public ModelAndView add(ModelAndView mv,Kstj t, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.add(t,c);
		if(i>0) {
			mv.addObject("msg","增加用户成功");
			mv.setViewName("/teacher/kstj.action");
		}else {
			mv.addObject("msg","增加用户失败");
			mv.setViewName("/stu/add.jsp");
		}
		return mv;
	}

}

package com.yhocn.shezhi.controller;

import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.shezhi.service.ShezhiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/te")
public class ShezhiController {


	@Autowired
	private ShezhiService service;

	@RequestMapping("/shezhi")
	public ModelAndView query(ModelAndView mv, Shezhi t) {
		List<Shezhi> szlist = service.selectAll(t);
		mv.addObject("szlist",szlist);
		mv.setViewName("/te/shezhi.jsp");
		return mv;
	}


	@RequestMapping("/toalter")
	public ModelAndView toalter(ModelAndView mv,Shezhi t) {
		Shezhi t2 = service.selectById(t);
		mv.addObject("shezhi",t2);
		mv.setViewName("/te/alter.jsp");
		return mv;
	}
	@RequestMapping("/alter")
	public ModelAndView alter(ModelAndView mv,Shezhi t) {
		int i = service.alter(t);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/te/shezhi.action");
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/te/shezhi.action");
		}
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv,Shezhi t,HttpSession se) {
		int i = service.update(t);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/te/update.jsp");
			se.setAttribute("GLOBAL_USER", t);
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/te/update.jsp");
		}
		return mv;
	}
	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView mv,Shezhi t) {
		int i = service.delete(t);
		if(i>0) {
			mv.addObject("msg","删除用户成功");
		}else {
			mv.addObject("msg","删除用户失败");
		}
		mv.setViewName("/te/shezhi.action");
		return mv;
	}
	@RequestMapping("/add")
	public ModelAndView add(ModelAndView mv,Shezhi t) {
		int i = service.add(t);
		if(i>0) {
			mv.addObject("msg","增加用户成功");
			mv.setViewName("/te/shezhi.action");
		}else {
			mv.addObject("msg","增加用户失败");
			mv.setViewName("/stu/add.jsp");
		}
		return mv;
	}

}

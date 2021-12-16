package com.yhocn.income.controller;

import java.util.List;

import com.yhocn.pay.entity.Payment;
import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.student.entity.Student;
import com.yhocn.teacher.entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.income.entity.Income;
import com.yhocn.income.service.IncomeService;


import javax.servlet.http.HttpServletRequest;
import com.yhocn.login.controller.LoginController;

@Controller
@RequestMapping("/inc")
public class IncomeController {

	@Autowired
	private IncomeService service;

	@RequestMapping("/income")
	public ModelAndView query(ModelAndView mv, Income inc,String c) {
		LoginController b=new  LoginController();
		c=b.a;
		List<Income> inclist = service.selectAll(inc,c);
		mv.addObject("inclist",inclist);
		mv.setViewName("/inc/income.jsp");
		return mv;
	}
	@RequestMapping("/select")
	public ModelAndView info(ModelAndView mv, Income inc, String a, String b, String c,HttpServletRequest request) {
		a=request.getParameter("rgdate");
		b=request.getParameter("rgdate2");
		if(a.equals("")){
			a="1900/1/1";
		}
		if(b.equals("")){
			b="2300/1/1";
		}
		LoginController e=new  LoginController();
		c=e.a;
		List<Income> inclist = service.select(inc,a,b,c);
		mv.addObject("inclist",inclist);
		mv.setViewName("/inc/income.jsp");
		return mv;
	}
	@RequestMapping("/add")
	public ModelAndView add(ModelAndView mv,Income inc,String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.add(inc,c);

		if(i>0) {
			mv.addObject("msg","增加用户成功");
			mv.setViewName("/inc/income.action");
		}else {
			mv.addObject("msg","增加用户失败");
			mv.setViewName("/inc/add.action");
		}
		return mv;
	}

	@RequestMapping("/shezhi")
	public ModelAndView shezhiInfo(ModelAndView mv, Shezhi shezhi,String c){
		LoginController e=new  LoginController();
		c=e.a;
		List<Shezhi>shezhiList= service.shezhiList(shezhi,c);
		List<Shezhi>List= service.List(shezhi,c);
		mv.addObject("shezhiList",shezhiList);
		mv.addObject("List",List);
		mv.setViewName("/inc/add.jsp");
		return mv;
	}
	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv,Income inc, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.update(inc,c);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/inc/income.action");
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/inc/income.action");
		}
		return mv;
	}
	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView mv,Income inc, String c) {
		LoginController e=new  LoginController();
		c=e.a;

		int i = service.delete(inc,c);
		if(i>0) {
			mv.addObject("msg","删除用户成功");
		}else {
			mv.addObject("msg","删除用户失败");
		}
		mv.setViewName("/inc/income.action");
		return mv;
	}
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(ModelAndView mv, Income inc, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		Income inc1 = service.selectById(inc,c);
		mv.addObject("income",inc1);
		mv.setViewName("/inc/update.jsp");

		return mv;
	}
}

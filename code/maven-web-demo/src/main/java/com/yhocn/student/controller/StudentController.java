package com.yhocn.student.controller;

import java.util.List;

import com.sun.deploy.cache.BaseLocalApplicationProperties;
import com.yhocn.shezhi.entity.Shezhi;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.student.entity.Student;
import com.yhocn.student.service.StudentService;
import com.yhocn.login.controller.LoginController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/stu")
public class StudentController {

	@Autowired
	private StudentService service;

	@RequestMapping("/student")
	public ModelAndView query(ModelAndView mv,Student s, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		List<Student> list = service.selectAll(s,c);
		mv.addObject("list",list);
		mv.setViewName("/stu/student.jsp");
		return mv;
	}
	@RequestMapping("/student1")
	public ModelAndView query1(ModelAndView mv,Student s, String c, String a,String b,String d,String E,String f, HttpServletRequest request) {
		a=request.getParameter("date1");
		b=request.getParameter("date2");
		if(a.equals("")){
			a="1900/1/1";
		}
		if(b.equals("")){
			b="2300/1/1";
		}
		d=request.getParameter("realName").trim();
		E=request.getParameter("teacher").trim();
		f=request.getParameter("peixun").trim();
		LoginController e=new  LoginController();
		c=e.a;
//		session.setAttribute("page",1);

//		page=0;
		List<Student> list = service.selectAll1(s,c,a,b,d,E,f);
		mv.addObject("list",list);
		mv.setViewName("/stu/student.jsp");
		return mv;
	}
//     @RequestMapping(value = "/next_pagedo",method = RequestMethod.POST)
//     public ModelAndView query2(ModelAndView mv,Student s, String c, String a,String b,String d,String E,String f,Integer page, HttpServletRequest request, @RequestBody JSONObject params) {
//		 a=request.getParameter("date1");
//		 b=request.getParameter("date2");
//		 d=request.getParameter("realName");
//		 E=request.getParameter("teacher");
//		 f=request.getParameter("peixun");
//		 LoginController e=new  LoginController();
//		 c=e.a;
//		 page=Integer.parseInt(params.get("page").toString())*10;
//		 List<Student> list = service.selectAll1(s,c,a,b,d,E,f,page);
//		 mv.addObject("list",list);
//		 mv.setViewName("/stu/student.jsp");
//		 return mv;
//		     }
//
//	@RequestMapping(value = "/next_pageup",method = RequestMethod.POST)
//
//	public ModelAndView query3(ModelAndView mv,Student s, String c, String a,String b,String d,String E,String f,Integer page, HttpServletRequest request, @RequestBody JSONObject params) {
//		a=request.getParameter("date1");
//		b=request.getParameter("date2");
//		d=request.getParameter("realName");
//		E=request.getParameter("teacher");
//		f=request.getParameter("peixun");
//		LoginController e=new  LoginController();
//		c=e.a;
//		page=Integer.parseInt(params.get("page").toString())*10-10;
//		List<Student> list = service.selectAll1(s,c,a,b,d,E,f,page);
//		mv.addObject("list",list);
//		mv.setViewName("/stu/student.jsp");
//		return mv;
//	}
	@RequestMapping("/add")
	public ModelAndView add(ModelAndView mv,Student s, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.add(s,c);
		if(i>0) {
			mv.addObject("msg","增加用户成功");
			mv.setViewName("/stu/student.action");
		}else {
			mv.addObject("msg","增加用户失败");
			mv.setViewName("/stu/add.jsp");
		}
		return mv;
	}

	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(ModelAndView mv,Student s,Shezhi shezhi, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		Student s2 = service.selectById(s,c);
		List<Shezhi>shezhiList= service.shezhiList(shezhi,c);
		mv.addObject("shezhiList",shezhiList);
		mv.addObject("student",s2);
		mv.setViewName("/stu/update.jsp");

		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv,Student s, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.update(s,c);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/stu/student.jsp");
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/stu/update.jsp");
		}
		return mv;
	}
	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView mv,Student s, String c) {
		LoginController e=new  LoginController();
		c=e.a;

		int i = service.delete(s,c);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
		}else {
			mv.addObject("msg","修改用户失败");
		}
		mv.setViewName("/stu/student.jsp");
		return mv;
	}
	@RequestMapping("/ksclass")
	public ModelAndView ksclass(ModelAndView mv,Student s, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		List<Student> list = service.selectAll(s,c);
		mv.addObject("kslist",list);
		mv.setViewName("/stu/ksclass.jsp");
		return mv;
	}

	@RequestMapping("/arr")
	public ModelAndView arr(ModelAndView mv,Student s, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		List<Student> list = service.selectArr(s,c);
		mv.addObject("arrlist",list);
		mv.setViewName("/stu/arr.jsp");
		return mv;
	}
	@RequestMapping("/arr1")
	public ModelAndView arr1(ModelAndView mv,Student s, String c, String a, HttpServletRequest request) {
		a=request.getParameter("realName").trim();
		LoginController e=new  LoginController();
		c=e.a;
		List<Student> list = service.selectArr1(s,c,a);
		mv.addObject("arrlist",list);
		mv.setViewName("/stu/arr.jsp");
		return mv;
	}

	@RequestMapping("/inq")
	public ModelAndView inq(ModelAndView mv,Student s, String c, String a, HttpServletRequest request) {
		a=request.getParameter("realName").trim();
		LoginController e=new  LoginController();
		c=e.a;

		List<Student> select = service.selectByRealName(s,c,a);
		mv.addObject("select",select);
		mv.setViewName("/stu/inq.jsp");
		return mv;
	}
	@RequestMapping("/shezhi")
	public ModelAndView shezhiInfo(ModelAndView mv,Shezhi shezhi, String c){
		LoginController e=new  LoginController();
		c=e.a;
		List<Shezhi>shezhiList= service.shezhiList(shezhi,c);
		mv.addObject("shezhiList",shezhiList);
		mv.setViewName("/stu/add.jsp");
		return mv;
	}
}

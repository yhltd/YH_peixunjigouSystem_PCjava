package com.yhocn.student.controller;

import java.util.List;

import com.yhocn.shezhi.entity.Shezhi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.student.entity.Student;
import com.yhocn.student.service.StudentService;

@Controller
@RequestMapping("/stu")
public class StudentController {

	@Autowired
	private StudentService service;
	
	@RequestMapping("/student")
	public ModelAndView query(ModelAndView mv,Student s) {
		List<Student> list = service.selectAll(s);
		mv.addObject("list",list);
		mv.setViewName("/stu/student.jsp");
		return mv;
	}
	@RequestMapping("/add")
	public ModelAndView add(ModelAndView mv,Student s) {
		int i = service.add(s);
		if(i>0) {
			mv.addObject("msg","增加用户成功");
			mv.setViewName("/stu/student.jsp");
		}else {
			mv.addObject("msg","增加用户失败");
			mv.setViewName("/stu/add.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(ModelAndView mv,Student s,Shezhi shezhi) {
		Student s2 = service.selectById(s);
		List<Shezhi>shezhiList= service.shezhiList(shezhi);
		mv.addObject("shezhiList",shezhiList);
		mv.addObject("student",s2);
		mv.setViewName("/stu/update.jsp");
		
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv,Student s) {
		int i = service.update(s);
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
	public ModelAndView delete(ModelAndView mv,Student s) {
		
		int i = service.delete(s);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
		}else {
			mv.addObject("msg","修改用户失败");
		}
		mv.setViewName("/stu/student.jsp");
		return mv;
	}
	@RequestMapping("/ksclass")
	public ModelAndView ksclass(ModelAndView mv,Student s) {
		List<Student> list = service.selectAll(s);
		mv.addObject("kslist",list);
		mv.setViewName("/stu/ksclass.jsp");
		return mv;
	}
	@RequestMapping("/arr")
	public ModelAndView arr(ModelAndView mv,Student s) {
		List<Student> list = service.selectArr(s);
		mv.addObject("arrlist",list);
		mv.setViewName("/stu/arr.jsp");
		return mv;
	}
	@RequestMapping("/inq")
	public ModelAndView select(ModelAndView mv,Student s) {
		List<Student> select = service.selectByRealName(s);
		mv.addObject("select",select);
		mv.setViewName("/stu/inq.jsp");
		return mv;
	}
	@RequestMapping("/shezhi")
	public ModelAndView shezhiInfo(ModelAndView mv,Shezhi shezhi){
		List<Shezhi>shezhiList= service.shezhiList(shezhi);
		mv.addObject("shezhiList",shezhiList);
		mv.setViewName("/stu/add.jsp");
		return mv;
	}
}

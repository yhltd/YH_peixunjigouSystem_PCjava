package com.yhocn.teacher.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.teacher.entity.Teacher;
import com.yhocn.teacher.service.TeacherService;

@Controller
@RequestMapping("/tea")
public class TeacherController {


	@Autowired
	private TeacherService service;
	
	@RequestMapping("/teacher")
	public ModelAndView query(ModelAndView mv,Teacher t) {
		List<Teacher> telist = service.selectAll(t);
		mv.addObject("telist",telist);
		mv.setViewName("/tea/teacher.jsp");
		return mv;
	}
	
	
	@RequestMapping("/toalter")
	public ModelAndView toalter(ModelAndView mv,Teacher t) {
		Teacher t2 = service.selectById(t);
		mv.addObject("teacher",t2);
		mv.setViewName("/tea/alter.jsp");
		return mv;
	}
	@RequestMapping("/alter")
	public ModelAndView alter(ModelAndView mv,Teacher t) {
		int i = service.alter(t);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/tea/alter.jsp");
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/tea/alter.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv,Teacher t,HttpSession se) {
		int i = service.update(t);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/tea/update.jsp");
			se.setAttribute("GLOBAL_USER", t);
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/tea/update.jsp");
		}
		return mv;
	}
	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView mv,Teacher t) {
		int i = service.delete(t);
		if(i>0) {
			mv.addObject("msg","删除用户成功");
		}else {
			mv.addObject("msg","删除用户失败");
		}
		mv.setViewName("/tea/teacher.action");
		return mv;
	}
	@RequestMapping("/add")
	public ModelAndView add(ModelAndView mv,Teacher t) {
		int i = service.add(t);
		if(i>0) {
			mv.addObject("msg","增加用户成功");
			mv.setViewName("/tea/teacher.action");
		}else {
			mv.addObject("msg","增加用户失败");
			mv.setViewName("/stu/add.jsp");
		}
		return mv;
	}

}

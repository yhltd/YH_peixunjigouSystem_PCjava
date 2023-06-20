package com.yhocn.teacher.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.yhocn.keshi_detail.entity.Keshidetail;
import com.yhocn.keshi_detail.service.KeshiDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.teacher.entity.Teacher;
import com.yhocn.teacher.service.TeacherService;
import com.yhocn.login.controller.LoginController;

@Controller
@RequestMapping("/tea")
public class TeacherController {


	@Autowired
	private TeacherService service;
	@Autowired
	private KeshiDetailService service2;

	@RequestMapping("/teacher")
	public ModelAndView query(ModelAndView mv,Teacher t, String c) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getSel().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}

		c=e.a;
		List<Teacher> telist = service.selectAll(t,c);
		mv.addObject("telist",telist);
		mv.setViewName("/tea/teacher.jsp");
		return mv;
	}
	@RequestMapping("/teacher1")
	public ModelAndView query1(ModelAndView mv,Teacher t, String c, String a, String b, String d, HttpServletRequest request) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getSel().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}
		c=e.a;
		a=request.getParameter("realName").trim();
		b=request.getParameter("teacher").trim();
		d=request.getParameter("peixun").trim();
		List<Teacher> telist = service.selectAll1(t,c,a,b,d);
		mv.addObject("telist",telist);
		mv.setViewName("/tea/teacher.jsp");
		return mv;
	}

	@RequestMapping("/toalter")
	public ModelAndView toalter(ModelAndView mv,Teacher t, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		Teacher t2 = service.selectById(t,c);
		mv.addObject("teacher",t2);
		mv.setViewName("/tea/alter.jsp");
		return mv;
	}
	@RequestMapping("/alter")
	public ModelAndView alter(ModelAndView mv,Teacher t, String c) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getUpd().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}

		c=e.a;
		int i = service.alter(t,c);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/tea/teacher.action");
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/tea/alter.jsp");
		}
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv,Teacher t,HttpSession se, String c) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getUpd().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}
		c=e.a;
		int i = service.update(t,c);
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
	public ModelAndView delete(ModelAndView mv,Teacher t, String c) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getDel().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}
		c=e.a;
		int i = service.delete(t,c);
		if(i>0) {
			mv.addObject("msg","删除用户成功");
		}else {
			mv.addObject("msg","删除用户失败");
		}
		mv.setViewName("/tea/teacher.action");
		return mv;
	}
	@RequestMapping(value = "/add",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	public ModelAndView add(ModelAndView mv,Teacher t, String c) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getAdd().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}
		c=e.a;
		int i = service.add(t,c);
		if(i>0) {
			mv.addObject("msg","增加用户成功");
			mv.setViewName("/tea/teacher.action");
		}else {
			mv.addObject("msg","增加用户失败");
			mv.setViewName("/tea/add.jsp");
		}
		return mv;
	}
	@RequestMapping("/jisuan")
	public ModelAndView info1(ModelAndView mv, Keshidetail ksd, String a , String c, HttpServletRequest request) {
		a=request.getParameter("date2");
		String b=request.getParameter("teacher_name");
//        String strDateFormat = "yyyy-MM";
//        SimpleDateFormat sdf = new SimpleDateFormat(a);
		if (!a.equals("")){
			String s1[]=a.split("-");
			a=s1[0]+ "-" + s1[1];}
		LoginController e=new  LoginController();
		c=e.a;
		List<Keshidetail> list = service2.select1(ksd,c,a,b);
		mv.addObject("teacherKeshiList",list);
		mv.setViewName("/tea/jisuan.jsp");
		return mv;
	}
}

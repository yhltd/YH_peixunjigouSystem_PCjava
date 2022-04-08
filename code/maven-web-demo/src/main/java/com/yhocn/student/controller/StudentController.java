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
	public String a1;
	public String a2;
	public String a3;
	public String a4;
	public String a5;
	public int a6;
	public int a7;
	@Autowired
	private StudentService service;

	@RequestMapping("/student")
	public ModelAndView query(ModelAndView mv,Student s, String c, String a,String b,String d,String E,String f,Integer page, HttpSession session) {
		LoginController e=new  LoginController();
		c=e.a;
		session.setAttribute("page",1);
		List<Student> list = service.selectAll(s,c,a,b,d,E,f,page);
		mv.addObject("list",list);
		mv.setViewName("/stu/student.jsp");
		return mv;
	}
	@RequestMapping("/student1")
	public ModelAndView query1(ModelAndView mv,Student s, String c, String a,String b,String d,String E,String f,Integer page,HttpServletRequest request, HttpSession session) {
		a=request.getParameter("date1");
		b=request.getParameter("date2");
		if(a == null){
			a=a1;
			b=a2;
			d=a3;
			E=a4;
			f=a5;
			a6=1;
			if(a1== null){
				a="1900/1/1";
				b="2300/1/1";
				a1="1900/1/1";
				a2="2300/1/1";
			}
		}else{
			d=request.getParameter("realName").trim();
			E=request.getParameter("teacher").trim();
			f=request.getParameter("peixun").trim();
			if(a.equals("")){
				a="1900/1/1";
			}
			if(b.equals("")){
				b="2300/1/1";
			}
			a1=a;
			a2=b;
			a3=d;
			a4=E;
			a5=f;
			a6=1;
		}

		LoginController e=new  LoginController();
		c=e.a;
		session.setAttribute("page",1);

		page=0;
		List<Student> list = service.selectAll1(s,c,a,b,d,E,f,page);
		List<Student> list1 = service.selectAll(s,c,a,b,d,E,f,page);
		a7= (int)Math.floor(list1.size()/10);
		mv.addObject("list",list);
		mv.setViewName("/stu/student.jsp");
		return mv;
	}
	@RequestMapping("/student2")
	public ModelAndView query2(ModelAndView mv,Student s, String c, String a,String b,String d,String E,String f,Integer page,HttpServletRequest request, HttpSession session) {
		a=a1;
		b=a2;
		d=a3;
		E=a4;
		f=a5;
		LoginController e=new  LoginController();
		c=e.a;
		if(a6>1) {
			page = a6 * 10 - 20;
		}else if(a6==1){
			page = a6 * 10 - 10;
		}else{
			page=0;
		}
		a6=a6-1;
		if(a6<1){
			a6=1;
		}
		session.setAttribute("page",a6);
		List<Student> list = service.selectAll1(s,c,a,b,d,E,f,page);
		mv.addObject("list",list);
		mv.setViewName("/stu/student.jsp");
		return mv;
	}

	@RequestMapping("/student3")
	public ModelAndView query3(ModelAndView mv,Student s, String c, String a,String b,String d,String E,String f,Integer page,HttpServletRequest request, HttpSession session) {
		a=a1;
		b=a2;
		d=a3;
		E=a4;
		f=a5;
		LoginController e=new  LoginController();
		c=e.a;
		if(a6>=a7){
			a6=a7;
		}
		page=a6*10;
		a6=a6+1;
		session.setAttribute("page",a6);
		List<Student> list = service.selectAll1(s,c,a,b,d,E,f,page);
		mv.addObject("list",list);
		mv.setViewName("/stu/student.jsp");
		return mv;
	}
	@RequestMapping("/student4")
	public ModelAndView query4(ModelAndView mv,Student s, String c, String a,String b,String d,String E,String f,Integer page,HttpServletRequest request, HttpSession session) {
		a=a1;
		b=a2;
		d=a3;
		E=a4;
		f=a5;
		LoginController e=new  LoginController();
		c=e.a;
		page=a7*10;
		session.setAttribute("page",a7);
		List<Student> list = service.selectAll1(s,c,a,b,d,E,f,page);
		mv.addObject("list",list);
		mv.setViewName("/stu/student.jsp");
		return mv;
	}
	@RequestMapping("/add")
	public ModelAndView add(ModelAndView mv,Student s, String c) {


		LoginController e=new  LoginController();
		c=e.a;
		String b=s.getRgdate();
		if(b.equals("")){
			mv.addObject("msg","请选择日期");
			mv.setViewName("/stu/shezhi.action");
		}else if(b.equals(null)){
			mv.addObject("msg","请选择日期");
			mv.setViewName("/stu/shezhi.action");
		}else{
			int i = service.add(s,c);
			if(i>0) {
				mv.addObject("msg","增加用户成功");
				mv.setViewName("/stu/student1.action");
			}else {
				mv.addObject("msg","增加用户失败");
				mv.setViewName("/stu/shezhi.action");
			}
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
	@RequestMapping("/toSelect")
	public ModelAndView toSelect(ModelAndView mv,Student s,Shezhi shezhi, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		Student s2 = service.selectById(s,c);
		List<Shezhi>shezhiList= service.shezhiList(shezhi,c);
		mv.addObject("shezhiList",shezhiList);
		mv.addObject("student",s2);
		mv.setViewName("/stu/select.jsp");

		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv,Student s, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		String b=s.getRgdate();
		if(b.equals("")){
			mv.addObject("msg","请选择日期");
			mv.setViewName("/stu/toUpdate.action");
		}else if(b.equals(null)){
			mv.addObject("msg","请选择日期");
			mv.setViewName("/stu/toUpdate.action");
		}else {
			int i = service.update(s, c);
			if (i > 0) {
				mv.addObject("msg", "修改用户成功");
				mv.setViewName("/stu/student1.action");
			} else {
				mv.addObject("msg", "修改用户失败");
				mv.setViewName("/stu/toUpdate.action");
			}
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
		mv.setViewName("/stu/student1.action");
		return mv;
	}
	@RequestMapping("/ksclass")
	public ModelAndView ksclass(ModelAndView mv,Student s, String c, String a,String b,String d,String E,String f,Integer page) {
		LoginController e=new  LoginController();
		c=e.a;
		List<Student> list = service.selectAll(s,c,a,b,d,E,f,page);
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

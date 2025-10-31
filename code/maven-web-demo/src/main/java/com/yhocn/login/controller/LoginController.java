package com.yhocn.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.SessionUtil;
import Bean.StringUtils;
import com.yhocn.income.entity.Income;
import com.yhocn.jiami.eneity.jiami;
import com.yhocn.jiami.service.jiamiService;
import com.yhocn.power.entity.Power;
import com.yhocn.power.service.PowerService;
import com.yhocn.student.entity.Student;
import com.yhocn.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import com.yhocn.login.service.LoginService;
import com.yhocn.teacher.entity.Teacher;

@Controller
public class LoginController {

	public static String a;

	public static List<Power>quanxian;

	@Autowired
	private LoginService service;
	@Autowired
	private StudentService service2;
	@Autowired
	private PowerService service3;
	@Autowired
	private jiamiService service4;

	@RequestMapping("/login")
	public  ModelAndView login(Teacher t,HttpSession se,String isRemPwd,HttpServletResponse response, HttpServletRequest request,HttpSession session) throws ParseException {
		ModelAndView mv = new ModelAndView();
		Teacher t2 = service.login(t);
		this.a = request.getParameter("Company");

		if(t2!=null) {
			List<jiami> jiamiList = service4.selectAllJiami(t2.getCompany());
			if(jiamiList.size() == 0){
				mv.setViewName("/login.jsp");
				mv.addObject("msg","工具到期，请联系我公司续费");
			}else{
				String endtime = "";
				String mark1 = "";
				String mark2 = "";
				String mark3 = "";
				String mark4 = "";

				if(!jiamiList.get(0).getEndtime().equals("")){
					endtime = jiamiList.get(0).getEndtime().trim();
				}
				if(!jiamiList.get(0).getEndtime().equals("")){
					mark1 = jiamiList.get(0).getMark1().trim();
				}
				if(!jiamiList.get(0).getEndtime().equals("")){
					mark2 = jiamiList.get(0).getMark2().trim();
				}
				if(!jiamiList.get(0).getEndtime().equals("")){
					String mark3Value = jiamiList.get(0).getMark3();
					mark3 = (mark3Value != null) ? mark3Value.trim() : "";
//					mark3 = jiamiList.get(0).getMark3().trim();
					if(mark3 != ""){
						mark3 = mark3.split(":")[1];
						mark3 = mark3.replace("(","");
						mark3 = mark3.replace(")","");
					}
				}
				if(jiamiList.get(0).getMark4() != null){
					mark4 = jiamiList.get(0).getMark4().trim();
				}

				boolean panduan = true;
				if(!mark1.equals("a8xd2s")){
					if(endtime.equals("")){
						mv.setViewName("/login.jsp");
						mv.addObject("msg","工具到期，请联系我公司续费");
						panduan = false;
					}
					if(mark2.equals("")){
						mv.setViewName("/login.jsp");
						mv.addObject("msg","服务器到期，请联系我公司续费");
						panduan = false;
					}
					if(panduan){
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
						Date enddate = sdf.parse(endtime);
						Date fuwudate = sdf.parse(mark2);
						Date now = new Date();
						String this_time = sdf.format(now);
						now = sdf.parse(this_time);
						if(now.getTime() > enddate.getTime()){
							mv.setViewName("/login.jsp");
							mv.addObject("msg","工具到期，请联系我公司续费");
							panduan = false;
						}
						if(now.getTime() > fuwudate.getTime()){
							mv.setViewName("/login.jsp");
							mv.addObject("msg","服务器到期，请联系我公司续费");
							panduan = false;
						}
					}
				}
				if(panduan){
					String companyName = t.getCompany();  // 从Teacher对象获取公司名称
					session.setAttribute("companyName", companyName);
					String sessionCompany = (String) session.getAttribute("companyName");

					this.quanxian = service3.getListByName(t2.getId(),t2.getCompany());
					if(t2.getState().equals("正常")) {
						mv.setViewName("/main.jsp");
						se.setAttribute("GLOBAL_USER", t2);


						if("true".equals(isRemPwd)) {
							Cookie c1=new Cookie("userName", t.getUserName());
							c1.setMaxAge(10*24*60*60);
							response.addCookie(c1);

							Cookie c2=new Cookie("password",t.getPassword());
							c2.setMaxAge(10*24*60*60);
							response.addCookie(c2);

							Cookie c3=new Cookie("Company",t.getCompany());
							c3.setMaxAge(10*24*60*60);
							response.addCookie(c3);

						}else {
							Cookie c1=new Cookie("userName", t.getUserName());
							c1.setMaxAge(0);
							response.addCookie(c1);

							Cookie c2=new Cookie("password",t.getPassword());
							c2.setMaxAge(0);
							response.addCookie(c2);
						}
						Cookie c3=new Cookie("Company",t.getCompany());
						c3.setMaxAge(10*24*60*60);
						Student s=null;
						List<Student> list = service2.selectArr(s, t.getCompany());
						if (list.size()>0){
							se.setAttribute("qianfei", "有欠费学员，请前往欠费学员页面查看");
						}else{
							se.setAttribute("qianfei", "");
						}

						List<Student> list2 = service2.selectAll1(s, t.getCompany(),"1900/1/1","2200/1/1","","","",200000);
						double size=list.size();
						if (size/200000>0.9){
							se.setAttribute("rongliang","使用容量已超过90%，为正常使用请联系微信16619776280");
						}else{
							se.setAttribute("rongliang","使用容量未超过90%，请放心使用");
						}
						response.addCookie(c3);
						SessionUtil.setUserNum(session, StringUtils.cast(mark3));
					}else{
						mv.setViewName("/login.jsp");
						mv.addObject("msg","账户已被禁用");
					}
				}
			}
		}else {
			mv.setViewName("/login.jsp");
			mv.addObject("msg","用户名或者密码错误");
		}

		return mv;

	}
	@RequestMapping("/aa")
	public ModelAndView query(ModelAndView mv) {
		mv.setViewName("/login.action");
		return mv;
	}
}

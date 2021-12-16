package com.yhocn.pay.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.pay.entity.Payment;
import com.yhocn.pay.service.PaymentService;
import com.yhocn.login.controller.LoginController;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/pay")
public class PaymentController {

	@Autowired
	private PaymentService service;
	
	@RequestMapping("/payment1")
	public ModelAndView query(ModelAndView mv,Payment p, String a, String b, String c, String d,HttpServletRequest request) {
		LoginController e=new  LoginController();
		a=request.getParameter("date1");
		b=request.getParameter("date2");
		d=request.getParameter("realname").trim();
		if(a==""){
			a="1900/1/1";
		}
		if(b==""){
			b="2300/1/1";
		}
		c=e.a;
		List<Payment> plist = service.selectAll(p,a,b,c,d);
		mv.addObject("plist",plist);
		mv.setViewName("/pay/payment.jsp");
		return mv;
	}
	@RequestMapping("/payment")
	public ModelAndView query1(ModelAndView mv, Payment p, String c,  HttpServletRequest request) {

		LoginController e=new  LoginController();
		c=e.a;
		List<Payment> plist = service.selectAll1(p,c);
		mv.addObject("plist",plist);
		mv.setViewName("/pay/payment.jsp");
		return mv;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(ModelAndView mv,Payment p, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.add(p,c);
		if(i>0) {
			mv.addObject("msg","增加用户成功");
			mv.setViewName("/pay/payment.action");
		}else {
			mv.addObject("msg","增加用户失败");
			mv.setViewName("/pay/payment.action");
		}
		return mv;
	}
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(ModelAndView mv,Payment p, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		Payment p2 = service.selectById(p,c);
		mv.addObject("payment",p2);
		mv.setViewName("/pay/update.jsp");
		
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv,Payment p, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.update(p,c);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/pay/payment.action");
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/pay/update.action");
		}
		return mv;
	}
	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView mv,Payment p, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		int i = service.delete(p,c);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
		}else {
			mv.addObject("msg","修改用户失败");
		}
		mv.setViewName("/pay/payment.action");
		return mv;
	}
}

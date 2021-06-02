package com.yhocn.pay.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.pay.entity.Payment;
import com.yhocn.pay.service.PaymentService;

@Controller
@RequestMapping("/pay")
public class PaymentController {

	@Autowired
	private PaymentService service;
	
	@RequestMapping("/payment")
	public ModelAndView query(ModelAndView mv,Payment p) {
		List<Payment> plist = service.selectAll(p);
		mv.addObject("plist",plist);
		mv.setViewName("/pay/payment.jsp");
		return mv;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(ModelAndView mv,Payment p) {
		int i = service.add(p);
		if(i>0) {
			mv.addObject("msg","增加用户成功");
			mv.setViewName("/pay/payment.jsp");
		}else {
			mv.addObject("msg","增加用户失败");
			mv.setViewName("/pay/payment.jsp");
		}
		return mv;
	}
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(ModelAndView mv,Payment p) {
		Payment p2 = service.selectById(p);
		mv.addObject("payment",p2);
		mv.setViewName("/pay/update.jsp");
		
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv,Payment p) {
		int i = service.update(p);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/pay/payment.jsp");
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/pay/update.jsp");
		}
		return mv;
	}
	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView mv,Payment p) {
		int i = service.delete(p);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
		}else {
			mv.addObject("msg","修改用户失败");
		}
		mv.setViewName("/pay/payment.jsp");
		return mv;
	}
}

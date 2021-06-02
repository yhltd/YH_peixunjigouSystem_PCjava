package com.yhocn.income.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.income.entity.Income;
import com.yhocn.income.service.IncomeService;
import com.yhocn.student.entity.Student;

@Controller
@RequestMapping("/inc")
public class IncomeController {

	@Autowired
	private IncomeService service;
	
	@RequestMapping("/income")
	public ModelAndView query(ModelAndView mv,Income inc) {
		List<Income> inclist = service.selectAll(inc);
		mv.addObject("inclist",inclist);
		mv.setViewName("/inc/income.jsp");
		return mv;
	}
	@RequestMapping("/add")
	public ModelAndView add(ModelAndView mv,Income inc) {
		int i = service.add(inc);
		if(i>0) {
			mv.addObject("msg","增加用户成功");
			mv.setViewName("/inc/income.action");
		}else {
			mv.addObject("msg","增加用户失败");
			mv.setViewName("/inc/add.jsp");
		}
		return mv;
	}
}

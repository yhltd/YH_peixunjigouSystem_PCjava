package com.yhocn.income.service;

import java.util.List;

import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.teacher.entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhocn.income.entity.Income;
import com.yhocn.income.mapper.IncomeMapper;

import javax.servlet.http.Cookie;

@Service
public  class IncomeServiceImpl implements IncomeService{

	@Autowired
	public IncomeMapper dao;
	
	@Override
	public List<Income> selectAll(Income inc,String c) {
		return dao.selectAll(inc,c);
	}

	@Override
	public List<Income> select(Income inc,String a,String b, String c) { return dao.select(inc,a,b,c); }

	@Override
	public int add(Income inc, String c) { return dao.add(inc,c); }
	@Override
	public int update(Income inc, String c) { return dao.update(inc,c); }
	@Override
	public int delete(Income inc, String c) { return dao.delete(inc,c); }
	@Override
	public Income selectById(Income inc, String c) { return dao.selectById(inc,c); }
	@Override
	public List<Shezhi> shezhiList(Shezhi shezhi, String c) {
		return dao.shezhiList(shezhi,c);
	}

	@Override
	public List<Shezhi> List(Shezhi shezhi, String c) {
		return dao.List(shezhi,c);
	}



}

package com.yhocn.income.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhocn.income.entity.Income;
import com.yhocn.income.mapper.IncomeMapper;
@Service
public class IncomeServiceImpl implements IncomeService{

	@Autowired
	public IncomeMapper dao;
	
	@Override
	public List<Income> selectAll(Income inc) {
		return dao.selectAll(inc);
	}

	@Override
	public int add(Income inc) {
		return dao.add(inc);
	}

}

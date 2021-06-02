package com.yhocn.income.service;

import java.util.List;

import com.yhocn.income.entity.Income;

public interface IncomeService {

	public List<Income> selectAll(Income inc);
	public int add(Income inc);
}
			
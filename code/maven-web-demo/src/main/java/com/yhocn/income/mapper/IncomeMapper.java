package com.yhocn.income.mapper;

import java.util.List;

import com.yhocn.income.entity.Income;

public interface IncomeMapper {
	public List<Income> selectAll(Income inc);
	public int add(Income inc);


}

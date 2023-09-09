package com.yhocn.jiami.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.income.entity.Income;
import com.yhocn.income.mapper.IncomeMapper;
import com.yhocn.income.service.IncomeService;
import com.yhocn.jiami.eneity.jiami;
import com.yhocn.jiami.mapper.jiamiMapper;
import com.yhocn.shezhi.entity.Shezhi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public  class jiamiServiceImpl implements jiamiService {

	@Autowired
	public jiamiMapper dao;
	
	@Override
	public List<jiami> selectAllJiami(String name) {
		DynamicDataSourceHolder.setDataSource("dataSource2");
		return dao.selectAllJiami(name);
	}

}

package com.yhocn.shezhi.service;

import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.shezhi.mapper.ShezhiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShezhiServiceImpl implements ShezhiService{

	@Autowired
	private ShezhiMapper dao;
	@Override
	public List<Shezhi> selectAll(Shezhi t) {
		return dao.selectAll(t);
	}

	@Override
	public Shezhi selectById(Shezhi t) {
		return dao.selectById(t);
	}

	@Override
	public int add(Shezhi t) {
		return dao.add(t);
	}

	@Override
	public int update(Shezhi t) {
		return dao.update(t);
	}

	@Override
	public int delete(Shezhi t) {
		return dao.delete(t);
	}

	@Override
	public List<Shezhi> selectByTeacher(Shezhi t) {
		return dao.selectByTeacher(t);
	}

	@Override
	public int alter(Shezhi t) {
		return dao.alter(t);
	}



}

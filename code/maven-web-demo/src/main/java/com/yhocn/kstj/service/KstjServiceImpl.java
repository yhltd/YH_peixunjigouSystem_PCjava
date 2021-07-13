package com.yhocn.kstj.service;

import com.yhocn.kstj.entity.Kstj;
import com.yhocn.kstj.mapper.KstjMapper;
import com.yhocn.kstj.service.KstjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KstjServiceImpl implements KstjService{

	@Autowired
	private KstjMapper dao;
	@Override
	public List<Kstj> selectAll(Kstj t) {
		return dao.selectAll(t);
	}

	@Override
	public Kstj selectById(Kstj t) {
		return dao.selectById(t);
	}

	@Override
	public int add(Kstj t) {
		return dao.add(t);
	}

	@Override
	public int update(Kstj t) {
		return dao.update(t);
	}

	@Override
	public int delete(Kstj t) {
		return dao.delete(t);
	}

	@Override
	public List<Kstj> selectByName(Kstj t) {
		return dao.selectByName(t);
	}

	@Override
	public int alter(Kstj t) {
		return dao.alter(t);
	}



}

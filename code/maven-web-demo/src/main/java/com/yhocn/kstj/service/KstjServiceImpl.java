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
	public List<Kstj> selectAll(Kstj t, String c) {
		return dao.selectAll(t,c);
	}

	@Override
	public Kstj selectById(Kstj t, String c) {
		return dao.selectById(t,c);
	}

	@Override
	public int add(Kstj t, String c) {
		return dao.add(t,c);
	}

	@Override
	public int update(Kstj t, String c) {
		return dao.update(t,c);
	}

	@Override
	public int delete(Kstj t, String c) {
		return dao.delete(t,c);
	}

	@Override
	public List<Kstj> selectByName(Kstj t, String c) {
		return dao.selectByName(t,c);
	}

	@Override
	public int alter(Kstj t, String c) {
		return dao.alter(t,c);
	}



}

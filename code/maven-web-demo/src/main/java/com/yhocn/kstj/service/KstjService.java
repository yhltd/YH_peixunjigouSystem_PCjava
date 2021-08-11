package com.yhocn.kstj.service;


import com.yhocn.kstj.entity.Kstj;

import java.util.List;

public interface KstjService {

	public List<Kstj> selectAll(Kstj t, String c);
	public Kstj selectById(Kstj t, String c);
	public int add(Kstj t, String c);
	public int update(Kstj t, String c);
	public int delete(Kstj t, String c);
	public List<Kstj> selectByName(Kstj t, String c);
	public int alter(Kstj t, String c);

}
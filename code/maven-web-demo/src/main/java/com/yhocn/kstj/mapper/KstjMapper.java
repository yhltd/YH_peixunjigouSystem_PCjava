package com.yhocn.kstj.mapper;

import com.yhocn.kstj.entity.Kstj;

import java.util.List;

public interface KstjMapper {

	public Kstj login(Kstj t);
	public List<Kstj> selectAll(Kstj t);
	public Kstj selectById(Kstj t);
	public int add(Kstj t);
	public int update(Kstj t);
	public int delete(Kstj t);
	public List<Kstj> selectByName(Kstj t);
	public int alter(Kstj t);
	public List<Kstj> selectArr(Kstj t);


}
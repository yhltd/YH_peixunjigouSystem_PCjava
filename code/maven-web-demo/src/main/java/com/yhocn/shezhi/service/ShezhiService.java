package com.yhocn.shezhi.service;

import com.yhocn.shezhi.entity.Shezhi;

import java.util.List;

public interface ShezhiService {

	public List<Shezhi> selectAll(Shezhi t, String c);
	public Shezhi selectById(Shezhi t, String c);
	public int add(Shezhi t, String c);
	public int update(Shezhi t, String c);
	public int delete(Shezhi t, String c);
	public List<Shezhi> selectByTeacher(Shezhi t, String c);
	public int alter(Shezhi t, String c);

}
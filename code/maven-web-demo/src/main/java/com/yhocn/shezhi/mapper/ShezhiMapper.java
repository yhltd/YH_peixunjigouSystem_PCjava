package com.yhocn.shezhi.mapper;

import com.yhocn.shezhi.entity.Shezhi;

import java.util.List;

public interface ShezhiMapper {

	public Shezhi login(Shezhi t);
	public List<Shezhi> selectAll(Shezhi t);
	public Shezhi selectById(Shezhi t);
	public int add(Shezhi t);
	public int update(Shezhi t);
	public int delete(Shezhi t);
	public List<Shezhi> selectByTeacher(Shezhi t);
	public int alter(Shezhi t);
	public List<Shezhi> selectArr(Shezhi t);


}
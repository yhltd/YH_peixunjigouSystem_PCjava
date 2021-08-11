package com.yhocn.shezhi.mapper;

import com.yhocn.shezhi.entity.Shezhi;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShezhiMapper {

	public Shezhi login(Shezhi t,@Param("c")String c);
	public List<Shezhi> selectAll(Shezhi t,@Param("c")String c);
	public Shezhi selectById(Shezhi t,@Param("c")String c);
	public int add(Shezhi t,@Param("c")String c);
	public int update(Shezhi t,@Param("c")String c);
	public int delete(Shezhi t,@Param("c")String c);
	public List<Shezhi> selectByTeacher(Shezhi t,@Param("c")String c);
	public int alter(Shezhi t,@Param("c")String c);
	public List<Shezhi> selectArr(Shezhi t,@Param("c")String c);


}
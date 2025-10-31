package com.yhocn.shezhi.mapper;

import com.yhocn.shezhi.entity.Shezhi;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ShezhiMapper {

	public Shezhi login(@Param("t")Shezhi t,@Param("c")String c);
	public List<Shezhi> selectAll(@Param("t")Shezhi t,@Param("c")String c);
	public Shezhi selectById(@Param("t")Shezhi t,@Param("c")String c);
	public int add(@Param("t")Shezhi t,@Param("c")String c);
	public int update(@Param("t")Shezhi t,@Param("c")String c);
	public int delete(@Param("t")Shezhi t,@Param("c")String c);
	public List<Shezhi> selectByTeacher(@Param("t")Shezhi t,@Param("c")String c);
	public int alter(@Param("t")Shezhi t,@Param("c")String c);
	public List<Shezhi> selectArr(@Param("t")Shezhi t,@Param("c")String c);


}
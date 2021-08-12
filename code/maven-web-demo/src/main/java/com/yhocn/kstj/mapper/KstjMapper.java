package com.yhocn.kstj.mapper;

import com.yhocn.kstj.entity.Kstj;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KstjMapper {

	public Kstj login(@Param("t")Kstj t,@Param("c")String c);
	public List<Kstj> selectAll(@Param("t")Kstj t,@Param("c")String c);
	public Kstj selectById(@Param("t")Kstj t,@Param("c")String c);
	public int add(@Param("t")Kstj t,@Param("c")String c);
	public int update(@Param("t")Kstj t,@Param("c")String c);
	public int delete(@Param("t")Kstj t,@Param("c")String c);
	public List<Kstj> selectByName(@Param("t")Kstj t,@Param("c")String c);
	public int alter(@Param("t")Kstj t,@Param("c")String c);
	public List<Kstj> selectArr(@Param("t")Kstj t,@Param("c")String c);


}
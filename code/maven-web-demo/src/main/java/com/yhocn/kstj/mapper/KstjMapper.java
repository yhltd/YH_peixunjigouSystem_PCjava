package com.yhocn.kstj.mapper;

import com.yhocn.kstj.entity.Kstj;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KstjMapper {

	public Kstj login(Kstj t,@Param("c")String c);
	public List<Kstj> selectAll(Kstj t,@Param("c")String c);
	public Kstj selectById(Kstj t,@Param("c")String c);
	public int add(Kstj t,@Param("c")String c);
	public int update(Kstj t,@Param("c")String c);
	public int delete(Kstj t,@Param("c")String c);
	public List<Kstj> selectByName(Kstj t,@Param("c")String c);
	public int alter(Kstj t,@Param("c")String c);
	public List<Kstj> selectArr(Kstj t,@Param("c")String c);


}
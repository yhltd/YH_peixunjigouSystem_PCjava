package com.yhocn.income.mapper;

import java.util.List;

import com.yhocn.income.entity.Income;
import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.teacher.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.Cookie;

public interface IncomeMapper {
	public List<Income> selectAll(@Param("inc")Income inc,@Param("c")String c);
	public int add(@Param("inc")Income inc,@Param("c")String c);
	public List<Shezhi> shezhiList(@Param("shezhi")Shezhi shezhi,@Param("c")String c);
	public List<Shezhi> List(@Param("shezhi")Shezhi shezhi,@Param("c")String c);
	public List<Income> select(@Param("inc")Income inc, @Param("a")String a,@Param("b")String b,@Param("c")String c);



}

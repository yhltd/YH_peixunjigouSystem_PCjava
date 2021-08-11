package com.yhocn.income.mapper;

import java.util.List;

import com.yhocn.income.entity.Income;
import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.teacher.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.Cookie;

public interface IncomeMapper {
	public List<Income> selectAll(Income inc,@Param("c")String c);
	public int add(Income inc,@Param("c")String c);
	public List<Shezhi> shezhiList(Shezhi shezhi,@Param("c")String c);
	public List<Shezhi> List(Shezhi shezhi,@Param("c")String c);
	public List<Income> select(Income inc, @Param("a")String a,@Param("b")String b,@Param("c")String c);



}

package com.yhocn.income.service;

import java.util.List;

import com.yhocn.income.entity.Income;
import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.teacher.entity.Teacher;

import javax.servlet.http.Cookie;

public interface IncomeService {

	public List<Income> selectAll(Income inc, String c);
	public int add(Income inc, String c);
	public List<Shezhi> shezhiList(Shezhi shezhi, String c);
	public List<Shezhi> List(Shezhi shezhi, String c);
	List<Income> select(Income inc, String a, String b, String c);


    int update(Income inc, String c);

    int delete(Income inc, String c);

	Income selectById(Income inc, String c);
}
			